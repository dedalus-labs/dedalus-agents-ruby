# Dedalus Ruby API library

The Dedalus Ruby library provides convenient access to the Dedalus REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/dedalus-labs/dedalus-sdk-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## MCP Server

Use the Dedalus MCP Server to enable AI assistants to interact with this API, allowing them to explore endpoints, make test requests, and use documentation to help integrate this SDK into your application.

[![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/en-US/install-mcp?name=dedalus-labs-mcp&config=eyJuYW1lIjoiZGVkYWx1cy1sYWJzLW1jcCIsInRyYW5zcG9ydCI6Imh0dHAiLCJ1cmwiOiJodHRwczovL2RlZGFsdXMtc2RrLnN0bG1jcC5jb20iLCJoZWFkZXJzIjp7IngtZGVkYWx1cy1hcGkta2V5IjoiTXkgQVBJIEtleSIsIngtYXBpLWtleSI6Ik15IFggQVBJIEtleSJ9fQ)
[![Install in VS Code](https://img.shields.io/badge/_-Add_to_VS_Code-blue?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9Im5vbmUiIHZpZXdCb3g9IjAgMCA0MCA0MCI+PHBhdGggZmlsbD0iI0VFRSIgZmlsbC1ydWxlPSJldmVub2RkIiBkPSJNMzAuMjM1IDM5Ljg4NGEyLjQ5MSAyLjQ5MSAwIDAgMS0xLjc4MS0uNzNMMTIuNyAyNC43OGwtMy40NiAyLjYyNC0zLjQwNiAyLjU4MmExLjY2NSAxLjY2NSAwIDAgMS0xLjA4Mi4zMzggMS42NjQgMS42NjQgMCAwIDEtMS4wNDYtLjQzMWwtMi4yLTJhMS42NjYgMS42NjYgMCAwIDEgMC0yLjQ2M0w3LjQ1OCAyMCA0LjY3IDE3LjQ1MyAxLjUwNyAxNC41N2ExLjY2NSAxLjY2NSAwIDAgMSAwLTIuNDYzbDIuMi0yYTEuNjY1IDEuNjY1IDAgMCAxIDIuMTMtLjA5N2w2Ljg2MyA1LjIwOUwyOC40NTIuODQ0YTIuNDg4IDIuNDg4IDAgMCAxIDEuODQxLS43MjljLjM1MS4wMDkuNjk5LjA5MSAxLjAxOS4yNDVsOC4yMzYgMy45NjFhMi41IDIuNSAwIDAgMSAxLjQxNSAyLjI1M3YuMDk5LS4wNDVWMzMuMzd2LS4wNDUuMDk1YTIuNTAxIDIuNTAxIDAgMCAxLTEuNDE2IDIuMjU3bC04LjIzNSAzLjk2MWEyLjQ5MiAyLjQ5MiAwIDAgMS0xLjA3Ny4yNDZabS43MTYtMjguOTQ3LTExLjk0OCA5LjA2MiAxMS45NTIgOS4wNjUtLjAwNC0xOC4xMjdaIi8+PC9zdmc+)](https://vscode.stainless.com/mcp/%7B%22name%22%3A%22dedalus-labs-mcp%22%2C%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fdedalus-sdk.stlmcp.com%22%2C%22headers%22%3A%7B%22x-dedalus-api-key%22%3A%22My%20API%20Key%22%2C%22x-api-key%22%3A%22My%20X%20API%20Key%22%7D%7D)

> Note: You may need to set environment variables in your MCP client.

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/dedalus-sdk).

The REST API documentation can be found on [docs.dedaluslabs.ai](https://docs.dedaluslabs.ai).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "dedalus-sdk", "~> 0.0.2"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "dedalus_sdk"

dedalus = DedalusSDK::Client.new(
  api_key: ENV["DEDALUS_API_KEY"], # This is the default and can be omitted
  environment: "development" # defaults to "production"
)

chat_completion = dedalus.chat.completions.create(
  model: "openai/gpt-5-nano",
  messages: [
    {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
    {role: "user", content: "Hello, how are you today?"}
  ]
)

puts(chat_completion.id)
```

### Streaming

We provide support for streaming responses using Server-Sent Events (SSE).

```ruby
stream = dedalus.chat.completions.create_streaming(
  model: "openai/gpt-5-nano",
  messages: [
    {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
    {role: "user", content: "What do you think of artificial intelligence?"}
  ]
)

stream.each do |completion|
  puts(completion.id)
end
```

### File uploads

Request parameters that correspond to file uploads can be passed as raw contents, a [`Pathname`](https://rubyapi.org/3.2/o/pathname) instance, [`StringIO`](https://rubyapi.org/3.2/o/stringio), or more.

```ruby
require "pathname"

# Use `Pathname` to send the filename and/or avoid paging a large file into memory:
transcription = dedalus.audio.transcriptions.create(file: Pathname("/path/to/file"))

# Alternatively, pass file contents or a `StringIO` directly:
transcription = dedalus.audio.transcriptions.create(file: File.read("/path/to/file"))

# Or, to control the filename and/or content type:
file = DedalusSDK::FilePart.new(File.read("/path/to/file"), filename: "/path/to/file", content_type: "…")
transcription = dedalus.audio.transcriptions.create(file: file)

puts(transcription)
```

Note that you can also pass a raw `IO` descriptor, but this disables retries, as the library can't be sure if the descriptor is a file or pipe (which cannot be rewound).

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `DedalusSDK::Errors::APIError` will be thrown:

```ruby
begin
  completion = dedalus.chat.completions.create(
    model: "openai/gpt-5-nano",
    messages: [
      {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
      {role: "user", content: "Hello, how are you today?"}
    ]
  )
rescue DedalusSDK::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue DedalusSDK::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue DedalusSDK::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
dedalus = DedalusSDK::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
dedalus.chat.completions.create(
  model: "openai/gpt-5-nano",
  messages: [
    {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
    {role: "user", content: "Hello, how are you today?"}
  ],
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
dedalus = DedalusSDK::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
dedalus.chat.completions.create(
  model: "openai/gpt-5-nano",
  messages: [
    {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
    {role: "user", content: "Hello, how are you today?"}
  ],
  request_options: {timeout: 5}
)
```

On timeout, `DedalusSDK::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `DedalusSDK::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
chat_completion =
  dedalus.chat.completions.create(
    model: "openai/gpt-5-nano",
    messages: [
      {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
      {role: "user", content: "Hello, how are you today?"}
    ],
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(chat_completion[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `DedalusSDK::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `DedalusSDK::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
dedalus.chat.completions.create(
  model: "openai/gpt-5-nano",
  messages: [
    DedalusSDK::Chat::ChatCompletionSystemMessageParam.new(
      content: "You are Stephen Dedalus. Respond in morose Joycean malaise."
    ),
    DedalusSDK::Chat::ChatCompletionUserMessageParam.new(content: "Hello, how are you today?")
  ]
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
dedalus.chat.completions.create(
  model: "openai/gpt-5-nano",
  messages: [
    {role: "system", content: "You are Stephen Dedalus. Respond in morose Joycean malaise."},
    {role: "user", content: "Hello, how are you today?"}
  ]
)

# You can also splat a full Params class:
params = DedalusSDK::Chat::CompletionCreateParams.new(
  model: "openai/gpt-5-nano",
  messages: [
    DedalusSDK::Chat::ChatCompletionSystemMessageParam.new(
      content: "You are Stephen Dedalus. Respond in morose Joycean malaise."
    ),
    DedalusSDK::Chat::ChatCompletionUserMessageParam.new(content: "Hello, how are you today?")
  ]
)
dedalus.chat.completions.create(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :float
puts(DedalusSDK::CreateEmbeddingRequest::EncodingFormat::FLOAT)

# Revealed type: `T.all(DedalusSDK::CreateEmbeddingRequest::EncodingFormat, Symbol)`
T.reveal_type(DedalusSDK::CreateEmbeddingRequest::EncodingFormat::FLOAT)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
dedalus.embeddings.create(
  encoding_format: DedalusSDK::CreateEmbeddingRequest::EncodingFormat::FLOAT,
  # …
)

# Literal values are also permissible:
dedalus.embeddings.create(
  encoding_format: :float,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/dedalus-labs/dedalus-sdk-ruby/tree/main/CONTRIBUTING.md).
