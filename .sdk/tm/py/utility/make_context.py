# Answerbook SDK utility: make_context

from core.context import AnswerbookContext


def make_context_util(ctxmap, basectx):
    return AnswerbookContext(ctxmap, basectx)
