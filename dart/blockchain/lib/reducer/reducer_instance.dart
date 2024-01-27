import 'dart:convert';
import 'dart:io';

import 'package:blockchain/codecs.dart';
import 'package:blockchain/genesis.dart';
import 'package:blockchain_protobuf/google/protobuf/struct.pb.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:hashlib/hashlib.dart';
import 'package:ribs_core/ribs_core.dart';
import 'package:rxdart/rxdart.dart';

class ReducerInstance {
  final String id;
  final String language;
  final String code;
  final Program program;
  final Ref<ReducerState> stateRef;

  ReducerInstance({
    required this.id,
    required this.language,
    required this.code,
    required this.program,
    required this.stateRef,
  });

  static IO<ReducerInstance> init(
          String language, String code, Struct input, Directory baseDir) =>
      (language != "dart")
          ? IO.raiseError(RuntimeException("Unsupported language"))
          : IO
              .delay(() {
                final compiler = Compiler();
                final program = compiler.compile({
                  "user_reducer": {"main.dart": code}
                });
                return program;
              })
              .flatMap((program) => IO.delay(() {
                    final runtime = Runtime.ofProgram(program);
                    final initialState = runtime.executeLib(
                            "package:user_reducer/main.dart", "init", [input])
                        as Struct;
                    return ReducerState(
                        blockId: Genesis.parentId, state: initialState);
                  }).tupleLeft(program))
              .flatMap(
                (r) => IO
                    .delay(() => Base58Encode(blake2b256.convert([
                          ...utf8.encode(language),
                          ...utf8.encode(code)
                        ]).bytes))
                    .flatTap(
                        (id) => r.$2.save(Directory("${baseDir.path}/$id")))
                    .flatMap(
                      (id) => IO.ref(r.$2).flatMap(
                            (stateRef) => IO.fromFutureF(() async {
                              final dir = Directory("${baseDir.path}/$id");
                              await Directory("$dir/states")
                                  .create(recursive: true);
                              await File("${dir.path}/code.dart")
                                  .writeAsString(code);
                              await File("${dir.path}/program.evc")
                                  .writeAsBytes(r.$1.write());
                              return ReducerInstance(
                                id: id,
                                language: language,
                                code: code,
                                program: r.$1,
                                stateRef: stateRef,
                              );
                            }),
                          ),
                    ),
              );

  IO<ReducerState> applyBlock(FullBlock block) => _invoke(block, "applyBlock")
      .map((res) => ReducerState(blockId: block.header.id, state: res))
      .flatTap(stateRef.setValue);

  IO<ReducerState> unapplyBlock(FullBlock block) =>
      _invoke(block, "unapplyBlock")
          .map((res) =>
              ReducerState(blockId: block.header.parentHeaderId, state: res))
          .flatTap(stateRef.setValue);

  IO<Struct> _invoke(FullBlock block, String functionName) =>
      IO.delay(() => Runtime.ofProgram(program)).flatMap((runtime) => stateRef
          .access()
          .map((t) => t.$1)
          .flatMap((state) => IO.delay(() => runtime.executeLib(
                "package:user_reducer/main.dart",
                functionName,
                [state.blockId, state.state, block],
              ) as Struct)));
}

class ReducerState {
  final BlockId blockId;
  final Struct state;

  ReducerState({required this.blockId, required this.state});

  IO<Unit> save(Directory baseDir) => IO
      .pure(Directory("${baseDir}/states"))
      .flatTap((statesDir) =>
          IO.fromFutureF(() => statesDir.create(recursive: true)))
      .flatMap((statesDir) => IO
          .fromFutureF(() => statesDir.list().whereType<File>().toList())
          .flatMap((otherStateFiles) => IO
              .fromFutureF(() => File("${baseDir.path}/states/${blockId.show}")
                  .writeAsBytes(state.writeToBuffer()))
              .flatTap((_) =>
                  IO.fromFutureF(() => Future.wait(otherStateFiles.map((f) => f.delete()))))))
      .voided();
}
