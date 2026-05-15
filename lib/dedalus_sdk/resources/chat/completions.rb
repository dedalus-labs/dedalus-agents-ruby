# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Chat
      class Completions
        # See {DedalusSDK::Resources::Chat::Completions#create_streaming} for streaming
        # counterpart.
        #
        # Some parameter documentations has been truncated, see
        # {DedalusSDK::Models::Chat::CompletionCreateParams} for more details.
        #
        # Create a chat completion.
        #
        # Generates a model response for the given conversation and configuration.
        # Supports OpenAI-compatible parameters and provider-specific extensions.
        #
        # Headers:
        #
        # - Authorization: bearer key for the calling account.
        # - X-Provider / X-Provider-Key: optional headers for using your own provider API
        #   key.
        #
        # Behavior:
        #
        # - If multiple models are supplied, the first one is used, and the agent may hand
        #   off to another model.
        # - Tools may be invoked on the server or signaled for the client to run.
        # - Streaming responses emit incremental deltas; non-streaming returns a single
        #   object.
        # - Usage metrics are computed when available and returned in the response.
        #
        # Responses:
        #
        # - 200 OK: JSON completion object with choices, message content, and usage.
        # - 400 Bad Request: validation error.
        # - 401 Unauthorized: authentication failed.
        # - 402 Payment Required or 429 Too Many Requests: quota, balance, or rate limit
        #   issue.
        # - 500 Internal Server Error: unexpected failure.
        #
        # Billing:
        #
        # - Token usage metered by the selected model(s).
        # - Tool calls and MCP sessions may be billed separately.
        # - Streaming is settled after the stream ends via an async task.
        #
        # Example (non-streaming HTTP): POST /v1/chat/completions Content-Type:
        # application/json Authorization: Bearer <key>
        #
        # { "model": "provider/model-name", "messages": [{"role": "user", "content":
        # "Hello"}] }
        #
        # 200 OK { "id": "cmpl_123", "object": "chat.completion", "choices": [ {"index":
        # 0, "message": {"role": "assistant", "content": "Hi there!"}, "finish_reason":
        # "stop"} ], "usage": {"prompt_tokens": 3, "completion_tokens": 4, "total_tokens":
        # 7} }
        #
        # Example (streaming over SSE): POST /v1/chat/completions Accept:
        # text/event-stream
        #
        # data: {"id":"cmpl_123","choices":[{"index":0,"delta":{"content":"Hi"}}]} data:
        # {"id":"cmpl_123","choices":[{"index":0,"delta":{"content":" there!"}}]} data:
        # [DONE]
        #
        # @overload create(model:, agent_attributes: nil, audio: nil, automatic_tool_execution: nil, cached_content: nil, correlation_id: nil, credentials: nil, deferred: nil, deferred_calls: nil, frequency_penalty: nil, function_call: nil, functions: nil, generation_config: nil, guardrails: nil, handoff_config: nil, handoff_mode: nil, inference_geo: nil, logit_bias: nil, logprobs: nil, max_completion_tokens: nil, max_tokens: nil, max_turns: nil, mcp_servers: nil, messages: nil, metadata: nil, modalities: nil, model_attributes: nil, n: nil, output_config: nil, parallel_tool_calls: nil, prediction: nil, presence_penalty: nil, prompt_cache_key: nil, prompt_cache_retention: nil, prompt_mode: nil, reasoning_effort: nil, response_format: nil, safe_prompt: nil, safety_identifier: nil, safety_settings: nil, search_parameters: nil, seed: nil, service_tier: nil, speed: nil, stop: nil, store: nil, stream_options: nil, system_instruction: nil, temperature: nil, thinking: nil, tool_choice: nil, tool_config: nil, tools: nil, top_k: nil, top_logprobs: nil, top_p: nil, user: nil, verbosity: nil, web_search_options: nil, request_options: {})
        #
        # @param model [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>] Model identifier. Accepts model ID strings, lists for routing, or DedalusModel o
        #
        # @param agent_attributes [Hash{Symbol=>Float}, nil] Agent attributes. Values in [0.0, 1.0].
        #
        # @param audio [DedalusSDK::Models::Chat::ChatCompletionAudioParam, nil] Parameters for audio output. Required when audio output is requested with
        #
        # @param automatic_tool_execution [Boolean] Execute tools server-side. If false, returns raw tool calls for manual handling.
        #
        # @param cached_content [String, nil] Optional. The name of the content [cached](https://ai.google.dev/gemini-api/docs
        #
        # @param correlation_id [String, nil] Stable session ID for resuming a previous handoff. Returned by the server on han
        #
        # @param credentials [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil] Credentials for MCP server authentication. Each credential is matched to servers
        #
        # @param deferred [Boolean, nil] If set to `true`, the request returns a `request_id`. You can then get the defer
        #
        # @param deferred_calls [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil] Tier 2 stateless resumption. Deferred tool specs from a previous handoff respons
        #
        # @param frequency_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on their
        #
        # @param function_call [String, nil] Deprecated in favor of `tool_choice`. Controls which (if any) function is calle
        #
        # @param functions [Array<DedalusSDK::Models::Chat::ChatCompletionFunctions>, nil] Deprecated in favor of `tools`. A list of functions the model may generate JSON
        #
        # @param generation_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Generation parameters wrapper (Google-specific)
        #
        # @param guardrails [Array<Hash{Symbol=>Object}>, nil] Content filtering and safety policy configuration.
        #
        # @param handoff_config [Hash{Symbol=>Object}, nil] Configuration for multi-model handoffs.
        #
        # @param handoff_mode [Boolean, nil] Handoff control. None or omitted: auto-detect. true: structured handoff (SDK). f
        #
        # @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
        #
        # @param logit_bias [Hash{Symbol=>Integer}, nil] Modify the likelihood of specified tokens appearing in the completion. Accepts
        #
        # @param logprobs [Boolean, nil] Whether to return log probabilities of the output tokens or not. If true, return
        #
        # @param max_completion_tokens [Integer, nil] Maximum tokens in completion (newer parameter name)
        #
        # @param max_tokens [Integer, nil] Maximum tokens in completion
        #
        # @param max_turns [Integer, nil] Maximum conversation turns.
        #
        # @param mcp_servers [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil] MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec object
        #
        # @param messages [Array<DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam, DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam, DedalusSDK::Models::Chat::ChatCompletionUserMessageParam, DedalusSDK::Models::Chat::ChatCompletionAssistantMessageParam, DedalusSDK::Models::Chat::ChatCompletionToolMessageParam, DedalusSDK::Models::Chat::ChatCompletionFunctionMessageParam>, nil] Conversation history (OpenAI: messages, Google: contents, Responses: input)
        #
        # @param metadata [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set of 16 key-value pairs that can be attached to an object. This can be useful
        #
        # @param modalities [Array<String>, nil] Output types that you would like the model to generate. Most models are capable
        #
        # @param model_attributes [Hash{Symbol=>Hash{Symbol=>Float}}, nil] Model attributes for routing. Maps model IDs to attribute dictionaries with valu
        #
        # @param n [Integer, nil] How many chat completion choices to generate for each input message. Note that y
        #
        # @param output_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        #
        # @param parallel_tool_calls [Boolean, nil] Whether to enable parallel tool calls (Anthropic uses inverted polarity).
        #
        # @param prediction [DedalusSDK::Models::Chat::PredictionContent, nil] Static predicted output content, such as the content of a text file that is
        #
        # @param presence_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on whethe
        #
        # @param prompt_cache_key [String, nil] Used by OpenAI to cache responses for similar requests to optimize your cache hi
        #
        # @param prompt_cache_retention [String, nil] The retention policy for the prompt cache. Set to `24h` to enable extended promp
        #
        # @param prompt_mode [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::PromptMode, nil] Allows toggling between the reasoning mode and no system prompt. When set to `re
        #
        # @param reasoning_effort [String, nil] Constrains effort on reasoning for [reasoning models](https://platform.openai.co
        #
        # @param response_format [DedalusSDK::Models::ResponseFormatText, DedalusSDK::Models::ResponseFormatJSONSchema, DedalusSDK::Models::ResponseFormatJSONObject, nil] An object specifying the format that the model must output. Setting to `{ "type
        #
        # @param safe_prompt [Boolean, nil] Whether to inject a safety prompt before all conversations.
        #
        # @param safety_identifier [String, nil] A stable identifier used to help detect users of your application that may be vi
        #
        # @param safety_settings [Array<DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting>, nil] Safety/content filtering settings (Google-specific)
        #
        # @param search_parameters [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set the parameters to be used for searched data. If not set, no data will be acq
        #
        # @param seed [Integer, nil] Random seed for deterministic output
        #
        # @param service_tier [String, nil] Service tier for request processing
        #
        # @param speed [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
        #
        # @param stop [Array<String>, String, nil] Sequences that stop generation
        #
        # @param store [Boolean, nil] Whether or not to store the output of this chat completion request for use in ou
        #
        # @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Options for streaming response. Only set this when you set `stream: true`.
        #
        # @param system_instruction [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, String, nil] System instruction/prompt
        #
        # @param temperature [Float, nil] Sampling temperature (0-2 for most providers)
        #
        # @param thinking [DedalusSDK::Models::Chat::ThinkingConfigEnabled, DedalusSDK::Models::Chat::ThinkingConfigDisabled, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Thinking::Adaptive, nil] Extended thinking configuration (Anthropic-specific)
        #
        # @param tool_choice [String, DedalusSDK::Models::Chat::ToolChoiceAuto, DedalusSDK::Models::Chat::ToolChoiceAny, DedalusSDK::Models::Chat::ToolChoiceTool, DedalusSDK::Models::Chat::ToolChoiceNone, nil] Controls which (if any) tool is called by the model. `none` means the model will
        #
        # @param tool_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Tool calling configuration (Google-specific)
        #
        # @param tools [Array<DedalusSDK::Models::Chat::ChatCompletionToolParam>, nil] Available tools/functions for the model
        #
        # @param top_k [Integer, nil] Top-k sampling parameter
        #
        # @param top_logprobs [Integer, nil] An integer between 0 and 20 specifying the number of most likely tokens to retur
        #
        # @param top_p [Float, nil] Nucleus sampling threshold
        #
        # @param user [String, nil] This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        #
        # @param verbosity [String, nil] Constrains the verbosity of the model's response. Lower values will result in mo
        #
        # @param web_search_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] This tool searches the web for relevant results to use in a response. Learn more
        #
        # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [DedalusSDK::Models::Chat::ChatCompletion]
        #
        # @see DedalusSDK::Models::Chat::CompletionCreateParams
        def create(params)
          parsed, options = DedalusSDK::Chat::CompletionCreateParams.dump_request(params)
          if parsed[:stream]
            message = "Please use `#create_streaming` for the streaming use case."
            raise ArgumentError.new(message)
          end
          @client.request(
            method: :post,
            path: "v1/chat/completions",
            body: parsed,
            model: DedalusSDK::Chat::ChatCompletion,
            options: options
          )
        end

        # See {DedalusSDK::Resources::Chat::Completions#create} for non-streaming
        # counterpart.
        #
        # Some parameter documentations has been truncated, see
        # {DedalusSDK::Models::Chat::CompletionCreateParams} for more details.
        #
        # Create a chat completion.
        #
        # Generates a model response for the given conversation and configuration.
        # Supports OpenAI-compatible parameters and provider-specific extensions.
        #
        # Headers:
        #
        # - Authorization: bearer key for the calling account.
        # - X-Provider / X-Provider-Key: optional headers for using your own provider API
        #   key.
        #
        # Behavior:
        #
        # - If multiple models are supplied, the first one is used, and the agent may hand
        #   off to another model.
        # - Tools may be invoked on the server or signaled for the client to run.
        # - Streaming responses emit incremental deltas; non-streaming returns a single
        #   object.
        # - Usage metrics are computed when available and returned in the response.
        #
        # Responses:
        #
        # - 200 OK: JSON completion object with choices, message content, and usage.
        # - 400 Bad Request: validation error.
        # - 401 Unauthorized: authentication failed.
        # - 402 Payment Required or 429 Too Many Requests: quota, balance, or rate limit
        #   issue.
        # - 500 Internal Server Error: unexpected failure.
        #
        # Billing:
        #
        # - Token usage metered by the selected model(s).
        # - Tool calls and MCP sessions may be billed separately.
        # - Streaming is settled after the stream ends via an async task.
        #
        # Example (non-streaming HTTP): POST /v1/chat/completions Content-Type:
        # application/json Authorization: Bearer <key>
        #
        # { "model": "provider/model-name", "messages": [{"role": "user", "content":
        # "Hello"}] }
        #
        # 200 OK { "id": "cmpl_123", "object": "chat.completion", "choices": [ {"index":
        # 0, "message": {"role": "assistant", "content": "Hi there!"}, "finish_reason":
        # "stop"} ], "usage": {"prompt_tokens": 3, "completion_tokens": 4, "total_tokens":
        # 7} }
        #
        # Example (streaming over SSE): POST /v1/chat/completions Accept:
        # text/event-stream
        #
        # data: {"id":"cmpl_123","choices":[{"index":0,"delta":{"content":"Hi"}}]} data:
        # {"id":"cmpl_123","choices":[{"index":0,"delta":{"content":" there!"}}]} data:
        # [DONE]
        #
        # @overload create_streaming(model:, agent_attributes: nil, audio: nil, automatic_tool_execution: nil, cached_content: nil, correlation_id: nil, credentials: nil, deferred: nil, deferred_calls: nil, frequency_penalty: nil, function_call: nil, functions: nil, generation_config: nil, guardrails: nil, handoff_config: nil, handoff_mode: nil, inference_geo: nil, logit_bias: nil, logprobs: nil, max_completion_tokens: nil, max_tokens: nil, max_turns: nil, mcp_servers: nil, messages: nil, metadata: nil, modalities: nil, model_attributes: nil, n: nil, output_config: nil, parallel_tool_calls: nil, prediction: nil, presence_penalty: nil, prompt_cache_key: nil, prompt_cache_retention: nil, prompt_mode: nil, reasoning_effort: nil, response_format: nil, safe_prompt: nil, safety_identifier: nil, safety_settings: nil, search_parameters: nil, seed: nil, service_tier: nil, speed: nil, stop: nil, store: nil, stream_options: nil, system_instruction: nil, temperature: nil, thinking: nil, tool_choice: nil, tool_config: nil, tools: nil, top_k: nil, top_logprobs: nil, top_p: nil, user: nil, verbosity: nil, web_search_options: nil, request_options: {})
        #
        # @param model [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>] Model identifier. Accepts model ID strings, lists for routing, or DedalusModel o
        #
        # @param agent_attributes [Hash{Symbol=>Float}, nil] Agent attributes. Values in [0.0, 1.0].
        #
        # @param audio [DedalusSDK::Models::Chat::ChatCompletionAudioParam, nil] Parameters for audio output. Required when audio output is requested with
        #
        # @param automatic_tool_execution [Boolean] Execute tools server-side. If false, returns raw tool calls for manual handling.
        #
        # @param cached_content [String, nil] Optional. The name of the content [cached](https://ai.google.dev/gemini-api/docs
        #
        # @param correlation_id [String, nil] Stable session ID for resuming a previous handoff. Returned by the server on han
        #
        # @param credentials [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil] Credentials for MCP server authentication. Each credential is matched to servers
        #
        # @param deferred [Boolean, nil] If set to `true`, the request returns a `request_id`. You can then get the defer
        #
        # @param deferred_calls [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil] Tier 2 stateless resumption. Deferred tool specs from a previous handoff respons
        #
        # @param frequency_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on their
        #
        # @param function_call [String, nil] Deprecated in favor of `tool_choice`. Controls which (if any) function is calle
        #
        # @param functions [Array<DedalusSDK::Models::Chat::ChatCompletionFunctions>, nil] Deprecated in favor of `tools`. A list of functions the model may generate JSON
        #
        # @param generation_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Generation parameters wrapper (Google-specific)
        #
        # @param guardrails [Array<Hash{Symbol=>Object}>, nil] Content filtering and safety policy configuration.
        #
        # @param handoff_config [Hash{Symbol=>Object}, nil] Configuration for multi-model handoffs.
        #
        # @param handoff_mode [Boolean, nil] Handoff control. None or omitted: auto-detect. true: structured handoff (SDK). f
        #
        # @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
        #
        # @param logit_bias [Hash{Symbol=>Integer}, nil] Modify the likelihood of specified tokens appearing in the completion. Accepts
        #
        # @param logprobs [Boolean, nil] Whether to return log probabilities of the output tokens or not. If true, return
        #
        # @param max_completion_tokens [Integer, nil] Maximum tokens in completion (newer parameter name)
        #
        # @param max_tokens [Integer, nil] Maximum tokens in completion
        #
        # @param max_turns [Integer, nil] Maximum conversation turns.
        #
        # @param mcp_servers [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil] MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec object
        #
        # @param messages [Array<DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam, DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam, DedalusSDK::Models::Chat::ChatCompletionUserMessageParam, DedalusSDK::Models::Chat::ChatCompletionAssistantMessageParam, DedalusSDK::Models::Chat::ChatCompletionToolMessageParam, DedalusSDK::Models::Chat::ChatCompletionFunctionMessageParam>, nil] Conversation history (OpenAI: messages, Google: contents, Responses: input)
        #
        # @param metadata [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set of 16 key-value pairs that can be attached to an object. This can be useful
        #
        # @param modalities [Array<String>, nil] Output types that you would like the model to generate. Most models are capable
        #
        # @param model_attributes [Hash{Symbol=>Hash{Symbol=>Float}}, nil] Model attributes for routing. Maps model IDs to attribute dictionaries with valu
        #
        # @param n [Integer, nil] How many chat completion choices to generate for each input message. Note that y
        #
        # @param output_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        #
        # @param parallel_tool_calls [Boolean, nil] Whether to enable parallel tool calls (Anthropic uses inverted polarity).
        #
        # @param prediction [DedalusSDK::Models::Chat::PredictionContent, nil] Static predicted output content, such as the content of a text file that is
        #
        # @param presence_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on whethe
        #
        # @param prompt_cache_key [String, nil] Used by OpenAI to cache responses for similar requests to optimize your cache hi
        #
        # @param prompt_cache_retention [String, nil] The retention policy for the prompt cache. Set to `24h` to enable extended promp
        #
        # @param prompt_mode [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::PromptMode, nil] Allows toggling between the reasoning mode and no system prompt. When set to `re
        #
        # @param reasoning_effort [String, nil] Constrains effort on reasoning for [reasoning models](https://platform.openai.co
        #
        # @param response_format [DedalusSDK::Models::ResponseFormatText, DedalusSDK::Models::ResponseFormatJSONSchema, DedalusSDK::Models::ResponseFormatJSONObject, nil] An object specifying the format that the model must output. Setting to `{ "type
        #
        # @param safe_prompt [Boolean, nil] Whether to inject a safety prompt before all conversations.
        #
        # @param safety_identifier [String, nil] A stable identifier used to help detect users of your application that may be vi
        #
        # @param safety_settings [Array<DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting>, nil] Safety/content filtering settings (Google-specific)
        #
        # @param search_parameters [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set the parameters to be used for searched data. If not set, no data will be acq
        #
        # @param seed [Integer, nil] Random seed for deterministic output
        #
        # @param service_tier [String, nil] Service tier for request processing
        #
        # @param speed [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
        #
        # @param stop [Array<String>, String, nil] Sequences that stop generation
        #
        # @param store [Boolean, nil] Whether or not to store the output of this chat completion request for use in ou
        #
        # @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Options for streaming response. Only set this when you set `stream: true`.
        #
        # @param system_instruction [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, String, nil] System instruction/prompt
        #
        # @param temperature [Float, nil] Sampling temperature (0-2 for most providers)
        #
        # @param thinking [DedalusSDK::Models::Chat::ThinkingConfigEnabled, DedalusSDK::Models::Chat::ThinkingConfigDisabled, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Thinking::Adaptive, nil] Extended thinking configuration (Anthropic-specific)
        #
        # @param tool_choice [String, DedalusSDK::Models::Chat::ToolChoiceAuto, DedalusSDK::Models::Chat::ToolChoiceAny, DedalusSDK::Models::Chat::ToolChoiceTool, DedalusSDK::Models::Chat::ToolChoiceNone, nil] Controls which (if any) tool is called by the model. `none` means the model will
        #
        # @param tool_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Tool calling configuration (Google-specific)
        #
        # @param tools [Array<DedalusSDK::Models::Chat::ChatCompletionToolParam>, nil] Available tools/functions for the model
        #
        # @param top_k [Integer, nil] Top-k sampling parameter
        #
        # @param top_logprobs [Integer, nil] An integer between 0 and 20 specifying the number of most likely tokens to retur
        #
        # @param top_p [Float, nil] Nucleus sampling threshold
        #
        # @param user [String, nil] This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        #
        # @param verbosity [String, nil] Constrains the verbosity of the model's response. Lower values will result in mo
        #
        # @param web_search_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] This tool searches the web for relevant results to use in a response. Learn more
        #
        # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [DedalusSDK::Internal::Stream<DedalusSDK::Models::Chat::ChatCompletionChunk>]
        #
        # @see DedalusSDK::Models::Chat::CompletionCreateParams
        def create_streaming(params)
          parsed, options = DedalusSDK::Chat::CompletionCreateParams.dump_request(params)
          unless parsed.fetch(:stream, true)
            message = "Please use `#create` for the non-streaming use case."
            raise ArgumentError.new(message)
          end
          parsed.store(:stream, true)
          @client.request(
            method: :post,
            path: "v1/chat/completions",
            headers: {"accept" => "text/event-stream", "accept-encoding" => "identity"},
            body: parsed,
            stream: DedalusSDK::Internal::Stream,
            model: DedalusSDK::Chat::ChatCompletionChunk,
            options: options
          )
        end

        # @api private
        #
        # @param client [DedalusSDK::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
