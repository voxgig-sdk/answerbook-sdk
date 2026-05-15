# Answerbook Lua SDK Reference

Complete API reference for the Answerbook Lua SDK.


## AnswerbookSDK

### Constructor

```lua
local sdk = require("answerbook_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```lua
local client = sdk.test(nil, nil)
```


### Instance Methods

#### `BookOfAnswer(data)`

Create a new `BookOfAnswer` entity instance. Pass `nil` for no initial data.

#### `GetApiDoc(data)`

Create a new `GetApiDoc` entity instance. Pass `nil` for no initial data.

#### `MarketData(data)`

Create a new `MarketData` entity instance. Pass `nil` for no initial data.

#### `PoetryOracle(data)`

Create a new `PoetryOracle` entity instance. Pass `nil` for no initial data.

#### `Tool(data)`

Create a new `Tool` entity instance. Pass `nil` for no initial data.

#### `Word(data)`

Create a new `Word` entity instance. Pass `nil` for no initial data.

#### `WordsLearning(data)`

Create a new `WordsLearning` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## BookOfAnswerEntity

```lua
local book_of_answer = client:BookOfAnswer(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | ``$STRING`` | No |  |
| `answer_i18n` | ``$OBJECT`` | No |  |
| `id` | ``$STRING`` | No |  |
| `meta` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:BookOfAnswer(nil):load({ id = "book_of_answer_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## GetApiDocEntity

```lua
local get_api_doc = client:GetApiDoc(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:GetApiDoc(nil):load({ id = "get_api_doc_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MarketDataEntity

```lua
local market_data = client:MarketData(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` | No |  |
| `sp500` | ``$OBJECT`` | No |  |
| `tw0050` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:MarketData(nil):load({ id = "market_data_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PoetryOracleEntity

```lua
local poetry__oracle = client:PoetryOracle(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | ``$OBJECT`` | No |  |
| `poem` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:PoetryOracle(nil):load({ id = "poetry__oracle_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ToolEntity

```lua
local tool = client:Tool(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Tool(nil):load({ id = "tool_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ToolEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## WordEntity

```lua
local word = client:Word(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$STRING`` | No |  |
| `definition` | ``$STRING`` | No |  |
| `word` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Word(nil):load({ id = "word_id" }, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WordEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## WordsLearningEntity

```lua
local words_learning = client:WordsLearning(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:WordsLearning(nil):list(nil, nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

