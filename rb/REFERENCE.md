# Answerbook Ruby SDK Reference

Complete API reference for the Answerbook Ruby SDK.


## AnswerbookSDK

### Constructor

```ruby
require_relative 'Answerbook_sdk'

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
book_of_answer = client.BookOfAnswer
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | `String` | No |  |
| `answer_i18n` | `Hash` | No |  |
| `id` | `String` | No |  |
| `meta` | `Hash` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.BookOfAnswer.load({ "id" => "book_of_answer_id" })
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
get_api_doc = client.GetApiDoc
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.GetApiDoc.load()
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
market_data = client.MarketData
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `change` | `String` | No |  |
| `percentChange` | `String` | No |  |
| `price` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.MarketData.load()
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
poetry__oracle = client.PoetryOracle
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `author` | `String` | No |  |
| `content` | `String` | No |  |
| `interpretation` | `String` | No |  |
| `poem` | `String` | No |  |
| `title` | `String` | No |  |
| `type` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.PoetryOracle.load()
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
tool = client.Tool
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `RandomPassword` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Tool.load()
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
word = client.Word
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `definition` | `String` | No |  |
| `word` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Word.load({ "id" => "word_id" })
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
words_learning = client.WordsLearning
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `categories` | `Array` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.WordsLearning.list
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

