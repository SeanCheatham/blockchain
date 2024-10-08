package com.giraffechain.ledger

import cats.data.{EitherT, NonEmptyChain}
import cats.effect.{Resource, Sync}
import cats.implicits.*
import com.giraffechain.*
import com.giraffechain.codecs.{*, given}
import com.giraffechain.crypto.CryptoResources
import com.giraffechain.models.*
import com.giraffechain.utility.*

trait TransactionValidation[F[_]]:
  def validate(transaction: Transaction, context: TransactionValidationContext): ValidationResult[F]

object TransactionValidation:
  def make[F[_]: Sync: CryptoResources](
      fetchTransactionOutput: FetchTransactionOutput[F],
      transactionOutputState: TransactionOutputState[F],
      accountState: AccountState[F],
      valueCalculator: ValueCalculator[F]
  ): Resource[F, TransactionValidation[F]] =
    Resource.pure(
      new TransactionValidationImpl[F](
        fetchTransactionOutput,
        transactionOutputState,
        accountState,
        valueCalculator
      )
    )

trait BodyValidation[F[_]]:
  def validate(body: FullBlockBody, context: TransactionValidationContext): ValidationResult[F]

object BodyValidation:
  def make[F[_]: Sync](
      fetchTransactionOutput: FetchTransactionOutput[F],
      transactionValidation: TransactionValidation[F]
  ): Resource[F, BodyValidation[F]] =
    Resource.pure(new BodyValidationImpl[F](fetchTransactionOutput, transactionValidation))

trait HeaderToBodyValidation[F[_]]:
  def validate(block: Block): ValidationResult[F]

object HeaderToBodyValidation:
  def make[F[_]: Sync](fetchHeader: FetchHeader[F]): Resource[F, HeaderToBodyValidation[F]] =
    Resource.pure((block: Block) =>
      EitherT(
        fetchHeader(block.header.parentHeaderId)
          .map(_.txRoot)
          .flatMap(parentTxRoot => Sync[F].delay(block.body.transactionIds.txRoot(parentTxRoot.decodeBase58)))
          .map(expectedTxRoot =>
            Either.cond(expectedTxRoot == block.header.txRoot.decodeBase58, (), NonEmptyChain("TxRoot Mismatch"))
          )
      )
    )

  def staticParentTxRoot[F[_]: Sync](txRoot: Bytes): Resource[F, HeaderToBodyValidation[F]] =
    Resource.pure((block: Block) =>
      EitherT(
        Sync[F]
          .delay(block.body.transactionIds.txRoot(txRoot))
          .map(expectedTxRoot =>
            Either.cond(expectedTxRoot == block.header.txRoot.decodeBase58, (), NonEmptyChain("TxRoot Mismatch"))
          )
      )
    )

case class TransactionValidationContext(
    parentBlockId: BlockId,
    height: Long,
    slot: Long
)

class TransactionValidationImpl[F[_]: Sync: CryptoResources](
    fetchTransactionOutput: FetchTransactionOutput[F],
    transactionOutputState: TransactionOutputState[F],
    accountState: AccountState[F],
    valueCalculator: ValueCalculator[F]
) extends TransactionValidation[F]:

  override def validate(transaction: Transaction, context: TransactionValidationContext): ValidationResult[F] =
    EitherT.fromEither[F](syntaxValidation(transaction)) >>
      valueCheck(transaction) >>
      attestationValidation(transaction) >>
      dataCheck(transaction) >>
      assetValidation(transaction) >>
      spendableUtxoCheck(context.parentBlockId, transaction)

  private def syntaxValidation(transaction: Transaction): Either[NonEmptyChain[String], Unit] =
    Either.cond(
      transaction.inputs.nonEmpty,
      (),
      NonEmptyChain("EmptyInputs")
    ) >>
      Either.cond(
        transaction.outputs.forall(_.quantity >= 0),
        (),
        NonEmptyChain("NonPositiveOutputQuantity")
      ) >>
      transaction.attestation.traverse(witnessTypeValidation).void

  private def valueCheck(transaction: Transaction): ValidationResult[F] = {
    EitherT(
      transaction.inputs
        .foldMapM(input => fetchTransactionOutput(input.reference).map(_.quantity))
        .map(_ - transaction.outputs.foldMap(_.quantity))
        .map(reward => Either.cond(reward >= 0, (), NonEmptyChain("InsufficientFunds")))
    ) >>
      transaction.outputs
        .traverse(output =>
          EitherT(
            valueCalculator
              .requiredMinimumQuantity(output)
              .map(required =>
                Either.cond(
                  output.quantity >= required,
                  (),
                  NonEmptyChain(s"InsufficientValue(${output.quantity} < $required)")
                )
              )
          )
        )
        .void
  }

  private def witnessTypeValidation(witness: Witness): Either[NonEmptyChain[String], Unit] =
    (witness.lock.value, witness.key.value) match {
      case (_: Lock.Value.Ed25519, _: Key.Value.Ed25519) => ().asRight
      case _                                             => NonEmptyChain("InvalidKeyType").asLeft
    }

  private def dataCheck(transaction: Transaction): ValidationResult[F] =
    transaction.inputs
      .traverse(input =>
        EitherT
          .fromEither[F](input.reference.transactionId.toRight(NonEmptyChain("SelfSpend")))
      )
      .void

  private def spendableUtxoCheck(parentBlockId: BlockId, transaction: Transaction): ValidationResult[F] =
    transaction.dependencies.toList.traverse(dependency =>
      EitherT(
        transactionOutputState
          .transactionOutputIsSpendable(parentBlockId, dependency)
          .map(Either.cond(_, (), NonEmptyChain("UnspendableUtxoReference")))
      )
    ) >>
      EitherT
        .liftF(
          transaction.inputs
            .filterA(i => fetchTransactionOutput(i.reference).map(_.accountRegistration.nonEmpty))
        )
        .flatMap(
          _.traverse(input =>
            EitherT(
              accountState
                .accountUtxos(parentBlockId, input.reference)
                .map(utxos =>
                  Either.cond(
                    utxos.exists(_.isEmpty),
                    (),
                    NonEmptyChain("NonEmptyAccount")
                  )
                )
            )
          )
        ) >>
      transaction.outputs
        .flatMap(_.account)
        .traverse(account =>
          EitherT(
            accountState
              .accountUtxos(parentBlockId, account)
              .map(utxos =>
                Either.cond(
                  utxos.nonEmpty,
                  (),
                  NonEmptyChain("NonExistentAccount")
                )
              )
          )
        )
        .void

  private def assetValidation(transaction: Transaction): ValidationResult[F] =
    for {
      _ <- EitherT.cond(
        transaction.outputs.forall(_.asset.forall(_.quantity > 0L)),
        (),
        NonEmptyChain("NonPositveAssetQuantity")
      )
      assetOutputs <- EitherT.pure(
        transaction.outputs
          .flatMap(_.asset)
          .foldLeft(Map.empty[TransactionOutputReference, Long])((m, a) =>
            m + (a.origin -> (a.quantity + m.getOrElse(a.origin, 0L)))
          )
      )
      transferredAssetOutputs = assetOutputs.view
        .filterKeys(origin => !transaction.inputs.exists(_.reference == origin))
        .toMap
      _ <-
        if (transferredAssetOutputs.isEmpty) EitherT.pure(())
        else
          EitherT
            .liftF(transaction.inputs.traverse(input => fetchTransactionOutput(input.reference)))
            .map(
              _.flatMap(_.asset).foldLeft(Map.empty[TransactionOutputReference, Long])((m, a) =>
                m + (a.origin -> (a.quantity + m.getOrElse(a.origin, 0L)))
              )
            )
            .flatMap(inputAssets =>
              EitherT.cond(
                transferredAssetOutputs.toList
                  .forall((origin, quantity) => inputAssets.get(origin).exists(_ >= quantity)),
                (),
                NonEmptyChain("InsufficientAssetQuantity")
              )
            )
    } yield ()

  private def attestationValidation(transaction: Transaction): ValidationResult[F] =
    for {
      providedLockAddressesList <- EitherT.pure(transaction.attestation.map(_.lockAddress))
      providedLockAddresses = providedLockAddressesList.toSet
      _ <- EitherT.cond(
        providedLockAddressesList.length == providedLockAddresses.size,
        (),
        NonEmptyChain("Duplicate Witness")
      )
      requiredLockAddresses <- EitherT.liftF(transaction.requiredWitnesses(fetchTransactionOutput))
      _ <- EitherT.cond(requiredLockAddresses == providedLockAddresses, (), NonEmptyChain("Insufficient Witness"))
      signableBytes = transaction.signableBytes.toByteArray
      _ <- transaction.attestation.traverse(witnessValidation(signableBytes))
    } yield ()

  private def witnessValidation(signableBytes: Array[Byte])(witness: Witness): ValidationResult[F] =
    for {
      _ <- EitherT.cond[F](witness.lock.address == witness.lockAddress, (), NonEmptyChain("Lock-Address Mismatch"))
      _ <- (witness.lock.value, witness.key.value) match {
        case (l: Lock.Value.Ed25519, k: Key.Value.Ed25519) =>
          EitherT(
            CryptoResources[F].ed25519
              .useSync(e =>
                e.verify(k.value.signature.decodeBase58.toByteArray, signableBytes, l.value.vk.decodeBase58.toByteArray)
              )
              .map(Either.cond(_, (), NonEmptyChain("InvalidSignature")))
          )
        case _ => EitherT.leftT(NonEmptyChain("InvalidKeyType"))
      }
    } yield ()

class BodyValidationImpl[F[_]: Sync](
    fetchTransactionOutput: FetchTransactionOutput[F],
    transactionValidation: TransactionValidation[F]
) extends BodyValidation[F]:
  override def validate(body: FullBlockBody, context: TransactionValidationContext): ValidationResult[F] =
    body.transactions
      .filter(_.rewardParentBlockId.isEmpty)
      .foldLeftM(Set.empty[TransactionOutputReference]) { (spentUtxos, transaction) =>
        val dependencies = transaction.dependencies
        EitherT.cond[F](
          spentUtxos.intersect(dependencies).isEmpty,
          (),
          NonEmptyChain("UnspendableUtxoReference")
        ) >>
          transactionValidation
            .validate(transaction, context)
            .as(spentUtxos ++ transaction.inputs.map(_.reference))
      } >> validateReward(body, context)

  private def validateReward(body: FullBlockBody, context: TransactionValidationContext) =
    EitherT(
      Sync[F]
        .delay(body.transactions.partition(_.rewardParentBlockId.isEmpty))
        .map((nonRewards, rewards) =>
          Either.cond(rewards.length <= 1, (nonRewards, rewards.headOption), NonEmptyChain("Duplicate Rewards"))
        )
    ).flatMap {
      case (_, None) => EitherT.rightT(())
      case (nonRewards, Some(reward)) =>
        EitherT.cond(
          reward.rewardParentBlockId.contains(context.parentBlockId),
          (),
          NonEmptyChain("RewardHeaderMismatch")
        ) >>
          EitherT.cond(reward.inputs.isEmpty, (), NonEmptyChain("RewardContainsInputs")) >>
          EitherT.cond(reward.outputs.length == 1, (), NonEmptyChain("RewardContainsMultipleOutputs")) >>
          EitherT.cond(
            reward.outputs.head.accountRegistration.isEmpty,
            (),
            NonEmptyChain("RewardContainsRegistration")
          ) >>
          EitherT.cond(
            reward.outputs.head.graphEntry.isEmpty,
            (),
            NonEmptyChain("RewardContainsGraphEntry")
          ) >> EitherT(
            nonRewards
              .foldMapM(_.reward(fetchTransactionOutput))
              .map(providedReward =>
                Either.cond(
                  providedReward >= reward.outputs.head.quantity,
                  (),
                  NonEmptyChain("ExcessiveReward")
                )
              )
          )
    }.void
