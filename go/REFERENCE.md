# Answerbook Golang SDK Reference

Complete API reference for the Answerbook Golang SDK.


## AnswerbookSDK

### Constructor

```go
func NewAnswerbookSDK(options map[string]any) *AnswerbookSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *AnswerbookSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *AnswerbookSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `BookOfAnswer(data map[string]any) AnswerbookEntity`

Create a new `BookOfAnswer` entity instance. Pass `nil` for no initial data.

#### `GetApiDoc(data map[string]any) AnswerbookEntity`

Create a new `GetApiDoc` entity instance. Pass `nil` for no initial data.

#### `MarketData(data map[string]any) AnswerbookEntity`

Create a new `MarketData` entity instance. Pass `nil` for no initial data.

#### `PoetryOracle(data map[string]any) AnswerbookEntity`

Create a new `PoetryOracle` entity instance. Pass `nil` for no initial data.

#### `Tool(data map[string]any) AnswerbookEntity`

Create a new `Tool` entity instance. Pass `nil` for no initial data.

#### `Word(data map[string]any) AnswerbookEntity`

Create a new `Word` entity instance. Pass `nil` for no initial data.

#### `WordsLearning(data map[string]any) AnswerbookEntity`

Create a new `WordsLearning` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## BookOfAnswerEntity

```go
bookOfAnswer := client.BookOfAnswer(nil)
fmt.Println(bookOfAnswer.GetName()) // "book_of_answer"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | `string` | No |  |
| `answer_i18n` | `map[string]any` | No |  |
| `id` | `string` | No |  |
| `meta` | `map[string]any` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.BookOfAnswer(nil).Load(map[string]any{"id": "book_of_answer_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## GetApiDocEntity

```go
getApiDoc := client.GetApiDoc(nil)
fmt.Println(getApiDoc.GetName()) // "get_api_doc"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.GetApiDoc(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MarketDataEntity

```go
marketData := client.MarketData(nil)
fmt.Println(marketData.GetName()) // "market_data"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `change` | `string` | No |  |
| `percentChange` | `string` | No |  |
| `price` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.MarketData(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PoetryOracleEntity

```go
poetryOracle := client.PoetryOracle(nil)
fmt.Println(poetryOracle.GetName()) // "poetry__oracle"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `author` | `string` | No |  |
| `content` | `string` | No |  |
| `interpretation` | `string` | No |  |
| `poem` | `string` | No |  |
| `title` | `string` | No |  |
| `type` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.PoetryOracle(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ToolEntity

```go
tool := client.Tool(nil)
fmt.Println(tool.GetName()) // "tool"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `RandomPassword` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Tool(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ToolEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## WordEntity

```go
word := client.Word(nil)
fmt.Println(word.GetName()) // "word"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `definition` | `string` | No |  |
| `word` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Word(nil).Load(map[string]any{"id": "word_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `WordEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## WordsLearningEntity

```go
wordsLearning := client.WordsLearning(nil)
fmt.Println(wordsLearning.GetName()) // "words_learning"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `categories` | `[]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.WordsLearning(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewAnswerbookSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

