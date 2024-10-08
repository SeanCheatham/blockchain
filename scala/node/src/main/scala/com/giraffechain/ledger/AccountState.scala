package com.giraffechain.ledger

import cats.data.OptionT
import cats.effect.kernel.MonadCancelThrow
import cats.effect.{Async, Resource}
import cats.implicits.*
import com.giraffechain.*
import com.giraffechain.codecs.given
import com.giraffechain.models.*

trait AccountState[F[_]] {

  def accountUtxos(
      parentBlockId: BlockId,
      account: TransactionOutputReference
  ): F[Option[List[TransactionOutputReference]]]

}

object AccountState:
  type State[F[_]] =
    Store[F, TransactionOutputReference, List[TransactionOutputReference]]
  type BSS[F[_]] = BlockSourcedState[F, State[F]]

  def make[F[_]: MonadCancelThrow](bss: BSS[F]): Resource[F, AccountState[F]] =
    Resource.pure(new AccountStateImpl[F](bss))

  def makeBSS[F[_]: Async](
      initialState: F[State[F]],
      initialBlockId: F[BlockId],
      blockIdTree: BlockIdTree[F],
      onBlockChanged: BlockId => F[Unit],
      fetchBody: FetchBody[F],
      fetchTransaction: FetchTransaction[F],
      fetchTransactionOutput: FetchTransactionOutput[F]
  ): Resource[F, BSS[F]] =
    new AccountStateBSSImpl[F](fetchBody, fetchTransaction, fetchTransactionOutput)
      .makeBss(initialState, initialBlockId, blockIdTree, onBlockChanged)

class AccountStateImpl[F[_]: MonadCancelThrow](bss: AccountState.BSS[F]) extends AccountState[F]:
  override def accountUtxos(
      parentBlockId: BlockId,
      account: TransactionOutputReference
  ): F[Option[List[TransactionOutputReference]]] =
    bss.stateAt(parentBlockId).use(_.get(account))

class AccountStateBSSImpl[F[_]: Async](
    fetchBody: FetchBody[F],
    fetchTransaction: FetchTransaction[F],
    fetchTransactionOutput: FetchTransactionOutput[F]
):
  def makeBss(
      initialState: F[AccountState.State[F]],
      initialBlockId: F[BlockId],
      blockIdTree: BlockIdTree[F],
      onBlockChanged: BlockId => F[Unit]
  ): Resource[F, AccountState.BSS[F]] =
    BlockSourcedState.make[F, AccountState.State[F]](
      initialState,
      initialBlockId,
      applyBlock,
      unapplyBlock,
      blockIdTree,
      onBlockChanged
    )

  def applyBlock(
      state: AccountState.State[F],
      blockId: BlockId
  ): F[AccountState.State[F]] =
    fetchBody(blockId)
      .map(_.transactionIds)
      .flatMap(
        _.foldLeftM(state)((state, transactionId) =>
          fetchTransaction(transactionId).flatMap(transaction =>
            transaction.inputs.foldLeftM(state)(applyInput) >>
              transaction.referencedOutputs
                .foldLeftM(state)(applyReferencedOutput)
          )
        )
      )

  private def applyInput(
      state: AccountState.State[F],
      input: TransactionInput
  ) =
    fetchTransactionOutput(input.reference)
      .flatMap(output =>
        OptionT
          .fromOption(output.account)
          .semiflatTap(account =>
            state
              .getOrRaise(account)
              .map(_.filterNot(_ == input.reference))
              .flatMap(state.put(account, _))
          )
          .void
          .orElse(
            OptionT
              .fromOption[F](output.accountRegistration)
              .semiflatTap(_ => state.remove(input.reference))
              .void
          )
          .value
      )
      .as(state)

  private def applyReferencedOutput(
      state: AccountState.State[F],
      referencedOutput: (TransactionOutputReference, TransactionOutput)
  ) = {
    val (outputReference, output) = referencedOutput
    OptionT
      .fromOption[F](output.account)
      .semiflatTap(account =>
        state
          .getOrRaise(account)
          .map(_ :+ outputReference)
          .flatTap(state.put(account, _))
      )
      .void
      .orElse(
        OptionT
          .fromOption[F](output.accountRegistration)
          .semiflatTap(_ => state.put(outputReference, Nil))
          .void
      )
      .value
      .as(state)
  }

  def unapplyBlock(
      state: AccountState.State[F],
      blockId: BlockId
  ): F[AccountState.State[F]] =
    fetchBody(blockId)
      .map(_.transactionIds.reverse)
      .flatMap(
        _.foldLeftM(state)((state, transactionId) =>
          fetchTransaction(transactionId).flatMap(transaction =>
            transaction.referencedOutputs.reverse
              .foldLeftM(state)(unapplyReferencedOutput) >>
              transaction.inputs.reverse.foldLeftM(state)(unapplyInput)
          )
        )
      )

  private def unapplyInput(
      state: AccountState.State[F],
      input: TransactionInput
  ) =
    fetchTransactionOutput(input.reference)
      .flatMap(output =>
        OptionT
          .fromOption(output.account)
          .semiflatTap(account =>
            state
              .getOrRaise(account)
              .map(_ :+ input.reference)
              .flatMap(state.put(account, _))
          )
          .void
          .orElse(
            OptionT
              .fromOption[F](output.accountRegistration)
              .semiflatTap(_ => state.put(input.reference, Nil))
              .void
          )
          .value
      )
      .as(state)

  private def unapplyReferencedOutput(
      state: AccountState.State[F],
      referencedOutput: (TransactionOutputReference, TransactionOutput)
  ) = {
    val (outputReference, output) = referencedOutput
    OptionT
      .fromOption[F](output.account)
      .semiflatTap(account =>
        state
          .getOrRaise(account)
          .map(_.filterNot(_ == outputReference))
          .flatTap(state.put(account, _))
      )
      .void
      .orElse(
        OptionT
          .fromOption[F](output.accountRegistration)
          .semiflatTap(_ => state.remove(outputReference))
          .void
      )
      .value
      .as(state)
  }
