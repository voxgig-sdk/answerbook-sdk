# Typed models for the Answerbook SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class BookOfAnswer(TypedDict, total=False):
    answer: str
    answer_i18n: dict
    id: str
    meta: dict


class BookOfAnswerLoadMatchRequired(TypedDict):
    id: str


class BookOfAnswerLoadMatch(BookOfAnswerLoadMatchRequired, total=False):
    answer: str
    answer_i18n: dict
    meta: dict


class GetApiDoc(TypedDict):
    pass


class GetApiDocLoadMatch(TypedDict):
    pass


class MarketData(TypedDict, total=False):
    nasdaq100: dict
    sp500: dict
    tw0050: dict


class MarketDataLoadMatch(TypedDict, total=False):
    nasdaq100: dict
    sp500: dict
    tw0050: dict


class PoetryOracle(TypedDict, total=False):
    oracle: dict
    poem: dict


class PoetryOracleLoadMatch(TypedDict, total=False):
    oracle: dict
    poem: dict


class Tool(TypedDict, total=False):
    random_password: str


class ToolLoadMatch(TypedDict, total=False):
    random_password: str


class Word(TypedDict, total=False):
    category: str
    definition: str
    word: str


class WordLoadMatch(TypedDict, total=False):
    category: str
    word: str
    id: str


class WordsLearning(TypedDict, total=False):
    category: list


class WordsLearningListMatch(TypedDict, total=False):
    category: list
