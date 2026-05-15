# Answerbook Python SDK Reference

Complete API reference for the Answerbook Python SDK.


## AnswerbookSDK

### Constructor

```python
from answerbook_sdk import AnswerbookSDK

client = AnswerbookSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `AnswerbookSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = AnswerbookSDK.test()
```


### Instance Methods

#### `BookOfAnswer(data=None)`

Create a new `BookOfAnswerEntity` instance. Pass `None` for no initial data.

#### `GetApiDoc(data=None)`

Create a new `GetApiDocEntity` instance. Pass `None` for no initial data.

#### `MarketData(data=None)`

Create a new `MarketDataEntity` instance. Pass `None` for no initial data.

#### `PoetryOracle(data=None)`

Create a new `PoetryOracleEntity` instance. Pass `None` for no initial data.

#### `Tool(data=None)`

Create a new `ToolEntity` instance. Pass `None` for no initial data.

#### `Word(data=None)`

Create a new `WordEntity` instance. Pass `None` for no initial data.

#### `WordsLearning(data=None)`

Create a new `WordsLearningEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> tuple`

Make a direct HTTP request to any API endpoint. Returns `(result, err)`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `(result_dict, err)`

#### `prepare(fetchargs=None) -> tuple`

Prepare a fetch definition without sending. Returns `(fetchdef, err)`.


---

## BookOfAnswerEntity

```python
book_of_answer = client.BookOfAnswer()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `answer` | ``$STRING`` | No |  |
| `answer_i18n` | ``$OBJECT`` | No |  |
| `id` | ``$STRING`` | No |  |
| `meta` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.BookOfAnswer().load({"id": "book_of_answer_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `BookOfAnswerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## GetApiDocEntity

```python
get_api_doc = client.GetApiDoc()
```

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.GetApiDoc().load({"id": "get_api_doc_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GetApiDocEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MarketDataEntity

```python
market_data = client.MarketData()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` | No |  |
| `sp500` | ``$OBJECT`` | No |  |
| `tw0050` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.MarketData().load({"id": "market_data_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MarketDataEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PoetryOracleEntity

```python
poetry__oracle = client.PoetryOracle()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `oracle` | ``$OBJECT`` | No |  |
| `poem` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.PoetryOracle().load({"id": "poetry__oracle_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PoetryOracleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ToolEntity

```python
tool = client.Tool()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `random_password` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Tool().load({"id": "tool_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ToolEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## WordEntity

```python
word = client.Word()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$STRING`` | No |  |
| `definition` | ``$STRING`` | No |  |
| `word` | ``$STRING`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Word().load({"id": "word_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WordEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## WordsLearningEntity

```python
words_learning = client.WordsLearning()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.WordsLearning().list({})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WordsLearningEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = AnswerbookSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

