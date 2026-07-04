# Answerbook Ruby SDK Reference

Complete API reference for the Answerbook Ruby SDK.


## AnswerbookSDK

### Constructor

```ruby
require_relative 'answerbook_sdk'

client = AnswerbookSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `AnswerbookSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = AnswerbookSDK.test
```


### Instance Methods

#### `BookOfAnswer(data = nil)`

Create a new `BookOfAnswer` entity instance. Pass `nil` for no initial data.

#### `GetApiDoc(data = nil)`

Create a new `GetApiDoc` entity instance. Pass `nil` for no initial data.

#### `MarketData(data = nil)`

Create a new `MarketData` entity instance. Pass `nil` for no initial data.

#### `PoetryOracle(data = nil)`

Create a new `PoetryOracle` entity instance. Pass `nil` for no initial data.

#### `Tool(data = nil)`

Create a new `Tool` entity instance. Pass `nil` for no initial data.

#### `Word(data = nil)`

Create a new `Word` entity instance. Pass `nil` for no initial data.

#### `WordsLearning(data = nil)`

Create a new `WordsLearning` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## BookOfAnswerEntity

```ruby
book_of_answer = client.book_of_answer
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | ``$STRING`` | No |  |
| `answer_i18n` | ``$OBJECT`` | No |  |
| `id` | ``$STRING`` | No |  |
| `meta` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.book_of_answer.load({ "id" => "book_of_answer_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## GetApiDocEntity

```ruby
get_api_doc = client.get_api_doc
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.get_api_doc.load({ "id" => "get_api_doc_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MarketDataEntity

```ruby
market_data = client.market_data
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` | No |  |
| `sp500` | ``$OBJECT`` | No |  |
| `tw0050` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.market_data.load({ "id" => "market_data_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PoetryOracleEntity

```ruby
poetry__oracle = client.poetry__oracle
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | ``$OBJECT`` | No |  |
| `poem` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.poetry__oracle.load({ "id" => "poetry__oracle_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ToolEntity

```ruby
tool = client.tool
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.tool.load({ "id" => "tool_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ToolEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## WordEntity

```ruby
word = client.word
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$STRING`` | No |  |
| `definition` | ``$STRING`` | No |  |
| `word` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.word.load({ "id" => "word_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `WordEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## WordsLearningEntity

```ruby
words_learning = client.words_learning
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.words_learning.list(nil)
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = AnswerbookSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

