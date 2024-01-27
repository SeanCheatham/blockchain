import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:blockchain/codecs.dart';
import 'package:blockchain/common/models/common.dart';
import 'package:blockchain/crypto/utils.dart';
import 'package:blockchain/ledger/block_header_to_body_validation.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:ribs_core/ribs_core.dart';

class Genesis {
  static const height = Int64.ONE;
  static const slot = Int64.ZERO;
  static final parentSlot = Int64(-1);

  static final parentId = BlockId()..value = Uint8List(32);
  static final operationalCertificate = OperationalCertificate()
    ..parentVK = (VerificationKeyKesProduct()
      ..value = _emptyBytes(32)
      ..step = 0)
    ..parentSignature = (SignatureKesProduct()
      ..superSignature = (SignatureKesSum()..verificationKey = _emptyBytes(32))
      ..subSignature = (SignatureKesSum()..verificationKey = _emptyBytes(32))
      ..subRoot = _emptyBytes(32))
    ..childVK = _emptyBytes(32)
    ..childSignature = _emptyBytes(64);

  static final stakingAccount = TransactionOutputReference(
      transactionId: TransactionId(value: _emptyBytes(32)));

  static Eta eta(List<int> prefix, Iterable<TransactionId> transactionIds) {
    final bytes = <int>[]..addAll(prefix);
    for (final id in transactionIds) bytes.addAll(id.value);
    return bytes.hash256;
  }

  static EligibilityCertificate eligibilityCertificate(Eta eta) =>
      EligibilityCertificate()
        ..vrfSig = _emptyBytes(80)
        ..vrfVK = _emptyBytes(32)
        ..thresholdEvidence = _emptyBytes(32)
        ..eta = eta;

  static Future<void> save(Directory directory, FullBlock block) async {
    await directory.create(recursive: true);
    final blockIdStr = block.header.id.show;
    Future<void> save(String name, List<int> data) async {
      final file = File("${directory.path}/$name");
      await file.writeAsBytes(data);
    }

    await save("$blockIdStr.header.pbuf", block.header.writeToBuffer());
    final body =
        BlockBody(transactionIds: block.fullBody.transactions.map((t) => t.id));
    await save("$blockIdStr.body.pbuf", body.writeToBuffer());
    for (final transaction in block.fullBody.transactions) {
      final transactionIdStr = transaction.id.show;
      await save(
          "$transactionIdStr.transaction.pbuf", transaction.writeToBuffer());
    }
  }

  static IO<FullBlock> loadFromDisk(Directory directory, BlockId blockId) =>
      IO.fromFutureF(() async {
        final blockIdStr = blockId.show;
        Future<List<int>> load(String name) async {
          final file = File("${directory.path}/$name");
          return file.readAsBytes();
        }

        final header =
            BlockHeader.fromBuffer(await load("$blockIdStr.header.pbuf"));

        header.embedId();

        assert(header.id == blockId);

        final body = BlockBody.fromBuffer(await load("$blockIdStr.body.pbuf"));
        final transactions = <Transaction>[];

        for (final transactionId in body.transactionIds) {
          final tx = Transaction.fromBuffer(
              await load("${transactionId.show}.transaction.pbuf"));
          tx.embedId();
          assert(tx.id == transactionId);
          transactions.add(tx);
        }

        final fullBody = FullBlockBody(transactions: transactions);
        final expectedTxRoot =
            TxRoot.calculateFromTransactions(Uint8List(32), transactions);
        assert(expectedTxRoot.sameElements(header.txRoot));
        return FullBlock(header: header, fullBody: fullBody);
      });
}

class GenesisConfig {
  final Int64 timestamp;
  final List<Transaction> transactions;
  final List<int> etaPrefix;
  final Map<String, String> settings;

  GenesisConfig(
      this.timestamp, this.transactions, this.etaPrefix, this.settings);

  static final DefaultEtaPrefix = utf8.encode("genesis");

  FullBlock get block {
    final transactionIds = transactions.map((tx) => tx.id);
    final header = BlockHeader()
      ..parentHeaderId = Genesis.parentId
      ..parentSlot = Genesis.parentSlot
      ..txRoot =
          TxRoot.calculateFromTransactionIds(Uint8List(32), transactionIds)
      ..timestamp = timestamp
      ..height = Genesis.height
      ..slot = Genesis.slot
      ..eligibilityCertificate =
          Genesis.eligibilityCertificate(Genesis.eta(etaPrefix, transactionIds))
      ..operationalCertificate = Genesis.operationalCertificate
      ..account = Genesis.stakingAccount;

    header.settings.addAll(settings);

    return FullBlock()
      ..header = header
      ..fullBody = (FullBlockBody()..transactions.addAll(transactions));
  }
}

Int8List _emptyBytes(int length) => Int8List(length);
