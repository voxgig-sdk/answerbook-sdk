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

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): AnswerbookUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

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

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## BookOfAnswerEntity

```php
$book_of_answer = $client->BookOfAnswer();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | `string` | No |  |
| `answer_i18n` | `array` | No |  |
| `id` | `string` | No |  |
| `meta` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->BookOfAnswer()->load(["id" => "book_of_answer_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): BookOfAnswerEntity`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## GetApiDocEntity

```php
$get_api_doc = $client->GetApiDoc();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->GetApiDoc()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): GetApiDocEntity`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MarketDataEntity

```php
$market_data = $client->MarketData();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | `array` | No |  |
| `sp500` | `array` | No |  |
| `tw0050` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->MarketData()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MarketDataEntity`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PoetryOracleEntity

```php
$poetry__oracle = $client->PoetryOracle();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | `array` | No |  |
| `poem` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->PoetryOracle()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PoetryOracleEntity`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ToolEntity

```php
$tool = $client->Tool();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Tool()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ToolEntity`

Create a new `ToolEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## WordEntity

```php
$word = $client->Word();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `definition` | `string` | No |  |
| `word` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Word()->load(["id" => "word_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): WordEntity`

Create a new `WordEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## WordsLearningEntity

```php
$words_learning = $client->WordsLearning();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `array` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->WordsLearning()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): WordsLearningEntity`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `get_name(): string`

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

