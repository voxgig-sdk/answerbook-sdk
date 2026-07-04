# Typed models for the Answerbook SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class BookOfAnswer:
    answer: Optional[str] = None
    answer_i18n: Optional[dict] = None
    id: Optional[str] = None
    meta: Optional[dict] = None


@dataclass
class BookOfAnswerLoadMatch:
    answer: Optional[str] = None
    answer_i18n: Optional[dict] = None
    id: Optional[str] = None
    meta: Optional[dict] = None


@dataclass
class GetApiDoc:
    pass


@dataclass
class GetApiDocLoadMatch:
    pass


@dataclass
class MarketData:
    nasdaq100: Optional[dict] = None
    sp500: Optional[dict] = None
    tw0050: Optional[dict] = None


@dataclass
class MarketDataLoadMatch:
    nasdaq100: Optional[dict] = None
    sp500: Optional[dict] = None
    tw0050: Optional[dict] = None


@dataclass
class PoetryOracle:
    oracle: Optional[dict] = None
    poem: Optional[dict] = None


@dataclass
class PoetryOracleLoadMatch:
    oracle: Optional[dict] = None
    poem: Optional[dict] = None


@dataclass
class Tool:
    random_password: Optional[str] = None


@dataclass
class ToolLoadMatch:
    random_password: Optional[str] = None


@dataclass
class Word:
    category: Optional[str] = None
    definition: Optional[str] = None
    word: Optional[str] = None


@dataclass
class WordLoadMatch:
    category: str
    word: str
    id: str


@dataclass
class WordsLearning:
    category: Optional[list] = None


@dataclass
class WordsLearningListMatch:
    category: Optional[list] = None

