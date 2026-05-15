# Answerbook Ruby SDK

The Ruby SDK for the Answerbook API. Provides an entity-oriented interface using idiomatic Ruby conventions.


## Install
```bash
gem install answerbook-sdk
```

Or add to your `Gemfile`:

```ruby
gem "answerbook-sdk"
```

Then run:

```bash
bundle install
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Answerbook_sdk"

client = AnswerbookSDK.new({
  "apikey" => ENV["ANSWERBOOK_APIKEY"],
})
```

### 3. Load a bookofanswer

```ruby
result, err = client.BookOfAnswer(nil).load({ "id" => "example_id" }, nil)
raise err if err
puts result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
raise err if err

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
end
```

### Prepare a request without sending it

```ruby
fetchdef, err = client.prepare({
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => { "id" => "example" },
})
raise err if err

puts fetchdef["url"]
puts fetchdef["method"]
puts fetchdef["headers"]
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = AnswerbookSDK.test(nil, nil)

result, err = client.Answerbook(nil).load(
  { "id" => "test01" }, nil
)
# result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = AnswerbookSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
ANSWERBOOK_TEST_LIVE=TRUE
ANSWERBOOK_APIKEY=<your-key>
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### AnswerbookSDK

```ruby
require_relative "Answerbook_sdk"
client = AnswerbookSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = AnswerbookSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### AnswerbookSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> [Hash, err]` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> [Hash, err]` | Build and send an HTTP request. |
| `BookOfAnswer` | `(data) -> BookOfAnswerEntity` | Create a BookOfAnswer entity instance. |
| `GetApiDoc` | `(data) -> GetApiDocEntity` | Create a GetApiDoc entity instance. |
| `MarketData` | `(data) -> MarketDataEntity` | Create a MarketData entity instance. |
| `PoetryOracle` | `(data) -> PoetryOracleEntity` | Create a PoetryOracle entity instance. |
| `Tool` | `(data) -> ToolEntity` | Create a Tool entity instance. |
| `Word` | `(data) -> WordEntity` | Create a Word entity instance. |
| `WordsLearning` | `(data) -> WordsLearningEntity` | Create a WordsLearning entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> [any, err]` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> [any, err]` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> [any, err]` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> [any, err]` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> [any, err]` | Remove an entity. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `[any, err]`. The first value is a
`Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### BookOfAnswer

| Field | Description |
| --- | --- |
| `answer` |  |
| `answer_i18n` |  |
| `id` |  |
| `meta` |  |

Operations: Load.

API path: `/answersWithMeta`

#### GetApiDoc

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/`

#### MarketData

| Field | Description |
| --- | --- |
| `nasdaq100` |  |
| `sp500` |  |
| `tw0050` |  |

Operations: Load.

API path: `/SP500`

#### PoetryOracle

| Field | Description |
| --- | --- |
| `oracle` |  |
| `poem` |  |

Operations: Load.

API path: `/TangPoetry`

#### Tool

| Field | Description |
| --- | --- |
| `random_password` |  |

Operations: Load.

API path: `/RandomPassword`

#### Word

| Field | Description |
| --- | --- |
| `category` |  |
| `definition` |  |
| `word` |  |

Operations: Load.

API path: `/words/{category}/{word}`

#### WordsLearning

| Field | Description |
| --- | --- |
| `category` |  |

Operations: List.

API path: `/words/categories`



## Entities


### BookOfAnswer

Create an instance: `const book_of_answer = client.BookOfAnswer()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `answer` | ``$STRING`` |  |
| `answer_i18n` | ``$OBJECT`` |  |
| `id` | ``$STRING`` |  |
| `meta` | ``$OBJECT`` |  |

#### Example: Load

```ts
const book_of_answer = await client.BookOfAnswer().load({ id: 'book_of_answer_id' })
```


### GetApiDoc

Create an instance: `const get_api_doc = client.GetApiDoc()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const get_api_doc = await client.GetApiDoc().load({ id: 'get_api_doc_id' })
```


### MarketData

Create an instance: `const market_data = client.MarketData()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `nasdaq100` | ``$OBJECT`` |  |
| `sp500` | ``$OBJECT`` |  |
| `tw0050` | ``$OBJECT`` |  |

#### Example: Load

```ts
const market_data = await client.MarketData().load({ id: 'market_data_id' })
```


### PoetryOracle

Create an instance: `const poetry__oracle = client.PoetryOracle()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `oracle` | ``$OBJECT`` |  |
| `poem` | ``$OBJECT`` |  |

#### Example: Load

```ts
const poetry__oracle = await client.PoetryOracle().load({ id: 'poetry__oracle_id' })
```


### Tool

Create an instance: `const tool = client.Tool()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `random_password` | ``$STRING`` |  |

#### Example: Load

```ts
const tool = await client.Tool().load({ id: 'tool_id' })
```


### Word

Create an instance: `const word = client.Word()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | ``$STRING`` |  |
| `definition` | ``$STRING`` |  |
| `word` | ``$STRING`` |  |

#### Example: Load

```ts
const word = await client.Word().load({ id: 'word_id' })
```


### WordsLearning

Create an instance: `const words_learning = client.WordsLearning()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | ``$ARRAY`` |  |

#### Example: List

```ts
const words_learnings = await client.WordsLearning().list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as a second return value.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Answerbook_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Answerbook_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
moon = client.Moon
moon.load({ "planet_id" => "earth", "id" => "luna" })

# moon.data_get now returns the loaded moon data
# moon.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
