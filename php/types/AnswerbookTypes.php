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

/** Request payload for BookOfAnswer#load. */
class BookOfAnswerLoadMatch
{
    public ?string $lang = null;
    public ?string $length = null;
    public ?string $mood = null;
    public ?string $style = null;
    public ?string $theme = null;
    public ?string $tone = null;
}

/** GetApiDoc entity data model. */
class GetApiDoc
{
}

/** Request payload for GetApiDoc#load. */
class GetApiDocLoadMatch
{
}

/** MarketData entity data model. */
class MarketData
{
    public ?string $change = null;
    public ?string $percentChange = null;
    public ?string $price = null;
}

/** Request payload for MarketData#load. */
class MarketDataLoadMatch
{
    public ?string $change = null;
    public ?string $percentChange = null;
    public ?string $price = null;
}

/** PoetryOracle entity data model. */
class PoetryOracle
{
    public ?string $author = null;
    public ?string $content = null;
    public ?string $interpretation = null;
    public ?string $poem = null;
    public ?string $title = null;
    public ?string $type = null;
}

/** Request payload for PoetryOracle#load. */
class PoetryOracleLoadMatch
{
    public ?string $author = null;
    public ?string $content = null;
    public ?string $interpretation = null;
    public ?string $poem = null;
    public ?string $title = null;
    public ?string $type = null;
}

/** Tool entity data model. */
class Tool
{
    public ?string $RandomPassword = null;
}

/** Request payload for Tool#load. */
class ToolLoadMatch
{
    public ?string $RandomPassword = null;
}

/** Word entity data model. */
class Word
{
    public ?string $category = null;
    public ?string $definition = null;
    public ?string $id = null;
    public ?string $word = null;
}

/** Request payload for Word#load. */
class WordLoadMatch
{
    public string $id;
}

/** WordsLearning entity data model. */
class WordsLearning
{
    public ?array $categories = null;
}

/** Request payload for WordsLearning#list. */
class WordsLearningListMatch
{
    public ?array $categories = null;
}

