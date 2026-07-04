<?php
declare(strict_types=1);

// Typed models for the Answerbook SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** BookOfAnswer entity data model. */
class BookOfAnswer
{
    public ?string $answer = null;
    public ?array $answer_i18n = null;
    public ?string $id = null;
    public ?array $meta = null;
}

/** Match filter for BookOfAnswer#load (any subset of BookOfAnswer fields). */
class BookOfAnswerLoadMatch
{
    public ?string $answer = null;
    public ?array $answer_i18n = null;
    public ?string $id = null;
    public ?array $meta = null;
}

/** GetApiDoc entity data model. */
class GetApiDoc
{
}

/** Match filter for GetApiDoc#load (any subset of GetApiDoc fields). */
class GetApiDocLoadMatch
{
}

/** MarketData entity data model. */
class MarketData
{
    public ?array $nasdaq100 = null;
    public ?array $sp500 = null;
    public ?array $tw0050 = null;
}

/** Match filter for MarketData#load (any subset of MarketData fields). */
class MarketDataLoadMatch
{
    public ?array $nasdaq100 = null;
    public ?array $sp500 = null;
    public ?array $tw0050 = null;
}

/** PoetryOracle entity data model. */
class PoetryOracle
{
    public ?array $oracle = null;
    public ?array $poem = null;
}

/** Match filter for PoetryOracle#load (any subset of PoetryOracle fields). */
class PoetryOracleLoadMatch
{
    public ?array $oracle = null;
    public ?array $poem = null;
}

/** Tool entity data model. */
class Tool
{
    public ?string $random_password = null;
}

/** Match filter for Tool#load (any subset of Tool fields). */
class ToolLoadMatch
{
    public ?string $random_password = null;
}

/** Word entity data model. */
class Word
{
    public ?string $category = null;
    public ?string $definition = null;
    public ?string $word = null;
}

/** Request payload for Word#load. */
class WordLoadMatch
{
    public string $category;
    public string $word;
    public string $id;
}

/** WordsLearning entity data model. */
class WordsLearning
{
    public ?array $category = null;
}

/** Match filter for WordsLearning#list (any subset of WordsLearning fields). */
class WordsLearningListMatch
{
    public ?array $category = null;
}

