# Answerbook SDK utility: make_context
require_relative '../core/context'
module AnswerbookUtilities
  MakeContext = ->(ctxmap, basectx) {
    AnswerbookContext.new(ctxmap, basectx)
  }
end
