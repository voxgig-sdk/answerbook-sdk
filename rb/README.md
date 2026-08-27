# Answerbook Ruby SDK



The Ruby SDK for the Answerbook API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.BookOfAnswer` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/answerbook-sdk/releases](https://github.com/voxgig-sdk/answerbook-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Answerbook_sdk"

client = AnswerbookSDK.new
```

### 3. Load a bookofanswer

```ruby
begin
  # load returns the ENTITY — call data_get for the BookOfAnswer record (raises on error).
  bookofanswer = client.BookOfAnswer.load()
  puts bookofanswer
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  marketdata = client.MarketData.load()
rescue => err
  warn "load failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = AnswerbookSDK.test

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
marketdata = client.MarketData.load()
puts marketdata
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
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
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
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `AnswerbookError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### BookOfAnswer

| Field | Description |
| --- | --- |
| `answer` | The answer text (bilingual or single language) |
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
| `change` |  |
| `percentChange` |  |
| `price` |  |

Operations: Load.

API path: `/SP500`

#### PoetryOracle

| Field | Description |
| --- | --- |
| `author` |  |
| `content` |  |
| `interpretation` |  |
| `poem` |  |
| `title` |  |
| `type` | Fortune type (Great Fortune, etc.) |

Operations: Load.

API path: `/TangPoetry`

#### Tool

| Field | Description |
| --- | --- |
| `RandomPassword` |  |

Operations: Load.

API path: `/RandomPassword`

#### Word

| Field | Description |
| --- | --- |
| `category` |  |
| `definition` |  |
| `id` |  |
| `word` |  |

Operations: Load.

API path: `/words/{category}/{word}`

#### WordsLearning

| Field | Description |
| --- | --- |
| `categories` |  |

Operations: List.

API path: `/words/categories`



## Entities


### BookOfAnswer

Create an instance: `book_of_answer = client.BookOfAnswer`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `answer` | `String` | The answer text (bilingual or single language) |
| `answer_i18n` | `Hash` |  |
| `id` | `String` |  |
| `meta` | `Hash` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the BookOfAnswer record (raises on error).
book_of_answer = client.BookOfAnswer.load()
```


### GetApiDoc

Create an instance: `get_api_doc = client.GetApiDoc`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the GetApiDoc record (raises on error).
get_api_doc = client.GetApiDoc.load()
```


### MarketData

Create an instance: `market_data = client.MarketData`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `change` | `String` |  |
| `percentChange` | `String` |  |
| `price` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the MarketData record (raises on error).
market_data = client.MarketData.load()
```


### PoetryOracle

Create an instance: `poetry__oracle = client.PoetryOracle`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `author` | `String` |  |
| `content` | `String` |  |
| `interpretation` | `String` |  |
| `poem` | `String` |  |
| `title` | `String` |  |
| `type` | `String` | Fortune type (Great Fortune, etc.) |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the PoetryOracle record (raises on error).
poetry__oracle = client.PoetryOracle.load()
```


### Tool

Create an instance: `tool = client.Tool`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `RandomPassword` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Tool record (raises on error).
tool = client.Tool.load()
```


### Word

Create an instance: `word = client.Word`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String` |  |
| `definition` | `String` |  |
| `id` | `String` |  |
| `word` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Word record (raises on error).
word = client.Word.load({ "id" => "word_id" })
```


### WordsLearning

Create an instance: `words_learning = client.WordsLearning`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `categories` | `Array` |  |

#### Example: List

```ruby
# list returns an Array of WordsLearning records (raises on error).
words_learnings = client.WordsLearning.list
```

## Features

This SDK ships 1 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`test`](#test) | In-memory mock transport for testing without a live server |

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

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

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

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
marketdata = client.MarketData
marketdata.load()

# marketdata.data_get now returns the marketdata data from the last load
# marketdata.match_get returns the last match criteria
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
