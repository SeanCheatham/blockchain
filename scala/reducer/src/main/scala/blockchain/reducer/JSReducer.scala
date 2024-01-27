package blockchain.reducer

import blockchain.models.{FullBlock, Transaction}
import cats.effect.Resource
import cats.effect.kernel.Sync
import com.google.protobuf.struct
import org.graalvm.polyglot.*
import org.graalvm.polyglot.proxy.*

object JSReducer:
  def apply[F[_]: Sync](
      context: Context
  )(functionCode: String, data: struct.Struct)(fullBlock: FullBlock): F[struct.Struct] =
    Sync[F].delay {
      val function = context.eval("js", functionCode)
      val encodedData = data.asGraalValue
      val encodedBlock = fullBlock.asGraalValue
      val result = function.execute(encodedData, encodedBlock)
      result.asStruct
    }

  extension (fullBlock: FullBlock) def asGraalValue: Value = ???
  extension (s: struct.Struct) def asGraalValue: Value = ???
  extension (value: Value) def asStruct: struct.Struct = ???

object GraalSupport:
  def makeContext[F[_]: Sync](): Resource[F, Context] =
    Resource.make(Sync[F].delay(Context.create()))(context => Sync[F].delay(context.close()))
