# Answerbook SDK utility: make_context

from projectname_sdk.core.context import AnswerbookContext


def make_context_util(ctxmap, basectx):
    return AnswerbookContext(ctxmap, basectx)
