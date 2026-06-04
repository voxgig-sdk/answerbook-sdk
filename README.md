# Answerbook SDK

Random answers, classical poetry, vocabulary lists, and market snapshots from a Cloudflare Workers API

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Answerbook API

The Answerbook API is a small multi-purpose service maintained by [tbdavid2019](https://github.com/tbdavid2019) and hosted at [answerbook.david888.com](https://answerbook.david888.com). It is deployed on Cloudflare Workers using the Hono framework, with data backed by Workers KV and interactive documentation served through Swagger UI.

What you get from the API:
- Random "book of answers" responses with bilingual variants (`/answers`, `/answersOriginal`, `/answersWithMeta`)
- Random password generation (`/RandomPassword`)
- Classical Chinese Tang poetry (`/TangPoetry`) and Japanese temple oracle draws (`/TempleOracleJP`)
- Vocabulary lists organised by exam category — GRE, TOEFL, IELTS, GMAT, SAT (`/words/categories`, `/words/{category}`, `/words/{category}/{word}`)
- Market snapshots for `/SP500`, `/nasdaq100`, and `/TW0050`

The service advertises CORS support and exposes a Model Context Protocol endpoint at `/mcp` for LLM tool use. No authentication or documented rate limits are required for the public endpoints.

## Try it

**TypeScript**
```bash
npm install answerbook
```

**Python**
```bash
pip install answerbook-sdk
```

**PHP**
```bash
composer require voxgig/answerbook-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/answerbook-sdk/go
```

**Ruby**
```bash
gem install answerbook-sdk
```

**Lua**
```bash
luarocks install answerbook-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { AnswerbookSDK } from 'answerbook'

const client = new AnswerbookSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o answerbook-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "answerbook": {
      "command": "/abs/path/to/answerbook-mcp"
    }
  }
}
```

## Entities

The API exposes 7 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **BookOfAnswer** | Random divination-style answers from the "book of answers" collection, served via `/answers`, `/answersOriginal`, and `/answersWithMeta`. | `/answersWithMeta` |
| **GetApiDoc** | Self-describing endpoints that return the API's own documentation / Swagger metadata. | `/` |
| **MarketData** | Snapshot market data for major indices, exposed at `/SP500`, `/nasdaq100`, and `/TW0050`. | `/SP500` |
| **PoetryOracle** | Classical text draws: Tang dynasty Chinese poems (`/TangPoetry`) and Japanese temple oracle slips (`/TempleOracleJP`). | `/TangPoetry` |
| **Tool** | Utility helpers such as the random password generator at `/RandomPassword`. | `/RandomPassword` |
| **Word** | Individual vocabulary entries looked up by category and word, via `/words/{category}/{word}`. | `/words/{category}/{word}` |
| **WordsLearning** | Exam-prep vocabulary collections (GRE, TOEFL, IELTS, GMAT, SAT) listed via `/words/categories` and `/words/{category}`. | `/words/categories` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from answerbook_sdk import AnswerbookSDK

client = AnswerbookSDK({})


# Load a specific bookofanswer
bookofanswer, err = client.BookOfAnswer(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'answerbook_sdk.php';

$client = new AnswerbookSDK([]);


// Load a specific bookofanswer
[$bookofanswer, $err] = $client->BookOfAnswer(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/answerbook-sdk/go"

client := sdk.NewAnswerbookSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Answerbook_sdk"

client = AnswerbookSDK.new({})


# Load a specific bookofanswer
bookofanswer, err = client.BookOfAnswer(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("answerbook_sdk")

local client = sdk.new({})


-- Load a specific bookofanswer
local bookofanswer, err = client:BookOfAnswer(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = AnswerbookSDK.test()
const result = await client.BookOfAnswer().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = AnswerbookSDK.test(None, None)
result, err = client.BookOfAnswer(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = AnswerbookSDK::test(null, null);
[$result, $err] = $client->BookOfAnswer(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.BookOfAnswer(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = AnswerbookSDK.test(nil, nil)
result, err = client.BookOfAnswer(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:BookOfAnswer(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Answerbook API

- Upstream: [https://answerbook.david888.com](https://answerbook.david888.com)

- The upstream repository [tbdavid2019/answerbook-api](https://github.com/tbdavid2019/answerbook-api) does not declare a license.
- Treat responses as informational; check with the operator before redistributing data.
- Tang poetry and oracle texts are public-domain classical works, but the curated collections may carry their own terms.

---

Generated from the Answerbook API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
