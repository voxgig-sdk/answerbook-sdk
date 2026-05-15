
import { Context } from './Context'


class AnswerbookError extends Error {

  isAnswerbookError = true

  sdk = 'Answerbook'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  AnswerbookError
}

