# Answerbook TypeScript SDK Reference

Complete API reference for the Answerbook TypeScript SDK.


## AnswerbookSDK

### Constructor

```ts
new AnswerbookSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `AnswerbookSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = AnswerbookSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `AnswerbookSDK` instance in test mode.


### Instance Methods

#### `BookOfAnswer(data?: object)`

Create a new `BookOfAnswer` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `BookOfAnswerEntity` instance.

#### `GetApiDoc(data?: object)`

Create a new `GetApiDoc` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `GetApiDocEntity` instance.

#### `MarketData(data?: object)`

Create a new `MarketData` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MarketDataEntity` instance.

#### `PoetryOracle(data?: object)`

Create a new `PoetryOracle` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PoetryOracleEntity` instance.

#### `Tool(data?: object)`

Create a new `Tool` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ToolEntity` instance.

#### `Word(data?: object)`

Create a new `Word` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `WordEntity` instance.

#### `WordsLearning(data?: object)`

Create a new `WordsLearning` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `WordsLearningEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `AnswerbookSDK.test()`.

**Returns:** `AnswerbookSDK` instance in test mode.


---

## BookOfAnswerEntity

```ts
const book_of_answer = client.BookOfAnswer()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | ``$STRING`` | No |  |
| `answer_i18n` | ``$OBJECT`` | No |  |
| `id` | ``$STRING`` | No |  |
| `meta` | ``$OBJECT`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.BookOfAnswer().load({ id: 'book_of_answer_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `BookOfAnswerEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## GetApiDocEntity

```ts
const get_api_doc = client.GetApiDoc()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.GetApiDoc().load({ id: 'get_api_doc_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `GetApiDocEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MarketDataEntity

```ts
const market_data = client.MarketData()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` | No |  |
| `sp500` | ``$OBJECT`` | No |  |
| `tw0050` | ``$OBJECT`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.MarketData().load({ id: 'market_data_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MarketDataEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PoetryOracleEntity

```ts
const poetry__oracle = client.PoetryOracle()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | ``$OBJECT`` | No |  |
| `poem` | ``$OBJECT`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.PoetryOracle().load({ id: 'poetry__oracle_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PoetryOracleEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ToolEntity

```ts
const tool = client.Tool()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | ``$STRING`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Tool().load({ id: 'tool_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ToolEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## WordEntity

```ts
const word = client.Word()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$STRING`` | No |  |
| `definition` | ``$STRING`` | No |  |
| `word` | ``$STRING`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Word().load({ id: 'word_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `WordEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## WordsLearningEntity

```ts
const words_learning = client.WordsLearning()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$ARRAY`` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.WordsLearning().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `WordsLearningEntity` instance with the same client and
options.

#### `client()`

Return the parent `AnswerbookSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new AnswerbookSDK({
  feature: {
    test: { active: true },
  }
})
```

