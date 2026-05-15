# Answerbook PHP SDK Reference

Complete API reference for the Answerbook PHP SDK.


## AnswerbookSDK

### Constructor

```php
require_once __DIR__ . '/answerbook_sdk.php';

$client = new AnswerbookSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `AnswerbookSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = AnswerbookSDK::test();
```


### Instance Methods

#### `BookOfAnswer($data = null)`

Create a new `BookOfAnswerEntity` instance. Pass `null` for no initial data.

#### `GetApiDoc($data = null)`

Create a new `GetApiDocEntity` instance. Pass `null` for no initial data.

#### `MarketData($data = null)`

Create a new `MarketDataEntity` instance. Pass `null` for no initial data.

#### `PoetryOracle($data = null)`

Create a new `PoetryOracleEntity` instance. Pass `null` for no initial data.

#### `Tool($data = null)`

Create a new `ToolEntity` instance. Pass `null` for no initial data.

#### `Word($data = null)`

Create a new `WordEntity` instance. Pass `null` for no initial data.

#### `WordsLearning($data = null)`

Create a new `WordsLearningEntity` instance. Pass `null` for no initial data.

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. Returns `[$result, $err]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array [$result, $err]`

#### `prepare(array $fetchargs = []): array`

Prepare a fetch definition without sending the request. Returns `[$fetchdef, $err]`.


---

## BookOfAnswerEntity

```php
$book_of_answer = $client->BookOfAnswer();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | ``$STRING`` | No |  |
| `answer_i18n` | ``$OBJECT`` | No |  |
| `id` | ``$STRING`` | No |  |
| `meta` | ``$OBJECT`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->BookOfAnswer()->load(["id" => "book_of_answer_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): BookOfAnswerEntity`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## GetApiDocEntity

```php
$get_api_doc = $client->GetApiDoc();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->GetApiDoc()->load(["id" => "get_api_doc_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): GetApiDocEntity`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## MarketDataEntity

```php
$market_data = $client->MarketData();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` | No |  |
| `sp500` | ``$OBJECT`` | No |  |
| `tw0050` | ``$OBJECT`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->MarketData()->load(["id" => "market_data_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): MarketDataEntity`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PoetryOracleEntity

```php
$poetry__oracle = $client->PoetryOracle();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | ``$OBJECT`` | No |  |
| `poem` | ``$OBJECT`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->PoetryOracle()->load(["id" => "poetry__oracle_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PoetryOracleEntity`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ToolEntity

```php
$tool = $client->Tool();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | ``$STRING`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Tool()->load(["id" => "tool_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ToolEntity`

Create a new `ToolEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## WordEntity

```php
$word = $client->Word();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$STRING`` | No |  |
| `definition` | ``$STRING`` | No |  |
| `word` | ``$STRING`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Word()->load(["id" => "word_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): WordEntity`

Create a new `WordEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## WordsLearningEntity

```php
$words_learning = $client->WordsLearning();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$ARRAY`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): array`

List entities matching the given criteria. Returns an array.

```php
[$results, $err] = $client->WordsLearning()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): WordsLearningEntity`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new AnswerbookSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

