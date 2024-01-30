import 'dart:convert';
import 'dart:io';

import 'package:blockchain/blockchain_view.dart';
import 'package:blockchain/codecs.dart';
import 'package:blockchain/genesis.dart';
import 'package:blockchain/traversal.dart';
import 'package:blockchain_protobuf/google/protobuf/struct.pb.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:fixnum/fixnum.dart';
import 'package:hashlib/hashlib.dart';
import 'package:quiver/async.dart';
import 'package:ribs_core/ribs_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart';

class ReducerInstance {
  final String id;
  final String code;
  final Runtime runtime;
  final Ref<ReducerState> stateRef;

  ReducerInstance({
    required this.id,
    required this.code,
    required this.runtime,
    required this.stateRef,
  });

  static IO<ReducerInstance> load(Directory baseDir, String id) => IO
      .pure(Directory("${baseDir.path}/$id"))
      .flatMap((dir) => IO.fromFutureF(() async {
            final code = await File("${dir.path}/code.dart").readAsString();
            final programBytes =
                await File("${dir.path}/code.dart").readAsBytes();
            final runtime = Runtime(programBytes.buffer.asByteData());
            final stateFile = await Directory("${dir.path}/states")
                .list()
                .whereType<File>()
                .first;
            final stateBytes = await stateFile.readAsBytes();
            final struct = Struct.fromBuffer(stateBytes);
            final idStr = basenameWithoutExtension(stateFile.path);
            final blockId = decodeBlockId(idStr);
            return (blockId, code, runtime, struct);
          }))
      .flatMap((r) => IO.ref(ReducerState(blockId: r.$1, state: r.$4)).map(
          (stateRef) => ReducerInstance(
              id: id, code: r.$2, runtime: r.$3, stateRef: stateRef)));

  static IO<ReducerInstance> init(
          String code, Struct input, Directory baseDir) =>
      IO
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
                return (
                  program,
                  runtime,
                  ReducerState(blockId: Genesis.parentId, state: initialState)
                );
              }))
          .flatMap(
            (r) => IO
                .delay(() =>
                    Base58Encode(blake2b256.convert(utf8.encode(code)).bytes))
                .flatTap((id) => r.$3.save(Directory("${baseDir.path}/$id")))
                .flatMap(
                  (id) => IO.ref(r.$3).flatMap(
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
                            code: code,
                            runtime: r.$2,
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

  IO<Struct> _invoke(FullBlock block, String functionName) => stateRef
      .access()
      .map((t) => t.$1)
      .flatMap((state) => IO.delay(() => runtime.executeLib(
            "package:user_reducer/main.dart",
            functionName,
            [state.blockId, state.state, block],
          ) as Struct));

  Stream<ReducerState> follow(BlockchainView view) => Stream.fromFuture(
          stateRef.value().map((s) => s.blockId).unsafeRunFuture())
      .asyncExpand(view.traversalFrom)
      .asyncMap((step) => IO
          .fromFutureF(() => view.getFullBlockOrRaise(step.blockId))
          .flatMap((block) => (step is TraversalStep_Applied)
              ? applyBlock(block)
              : unapplyBlock(block))
          .unsafeRunFuture());
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
