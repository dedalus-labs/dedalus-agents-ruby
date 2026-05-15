# typed: strong

module DedalusSDK
  module Resources
    class Chat
      class Completions
        # See {DedalusSDK::Resources::Chat::Completions#create_streaming} for streaming
        # counterpart.
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
        sig do
          params(
            model:
              T.any(
                String,
                DedalusSDK::DedalusModel::OrHash,
                T::Array[T.any(String, DedalusSDK::DedalusModel::OrHash)]
              ),
            agent_attributes: T.nilable(T::Hash[Symbol, Float]),
            audio:
              T.nilable(DedalusSDK::Chat::ChatCompletionAudioParam::OrHash),
            automatic_tool_execution: T::Boolean,
            cached_content: T.nilable(String),
            correlation_id: T.nilable(String),
            credentials:
              T.nilable(
                T.any(
                  DedalusSDK::Credential::OrHash,
                  T::Array[DedalusSDK::Credential::OrHash]
                )
              ),
            deferred: T.nilable(T::Boolean),
            deferred_calls:
              T.nilable(
                T::Array[DedalusSDK::Chat::DeferredCallResponse::OrHash]
              ),
            frequency_penalty: T.nilable(Float),
            function_call: T.nilable(String),
            functions:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionFunctions::OrHash]
              ),
            generation_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            guardrails: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
            handoff_config: T.nilable(T::Hash[Symbol, T.anything]),
            handoff_mode: T.nilable(T::Boolean),
            inference_geo: T.nilable(String),
            logit_bias: T.nilable(T::Hash[Symbol, Integer]),
            logprobs: T.nilable(T::Boolean),
            max_completion_tokens: T.nilable(Integer),
            max_tokens: T.nilable(Integer),
            max_turns: T.nilable(Integer),
            mcp_servers:
              T.nilable(
                T.any(
                  String,
                  DedalusSDK::MCPServerSpec::OrHash,
                  T::Array[T.any(String, DedalusSDK::MCPServerSpec::OrHash)]
                )
              ),
            messages:
              T.nilable(
                T::Array[
                  T.any(
                    DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionSystemMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionUserMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionAssistantMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionToolMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionFunctionMessageParam::OrHash
                  )
                ]
              ),
            metadata:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            modalities: T.nilable(T::Array[String]),
            model_attributes:
              T.nilable(T::Hash[Symbol, T::Hash[Symbol, Float]]),
            n: T.nilable(Integer),
            output_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            parallel_tool_calls: T.nilable(T::Boolean),
            prediction: T.nilable(DedalusSDK::Chat::PredictionContent::OrHash),
            presence_penalty: T.nilable(Float),
            prompt_cache_key: T.nilable(String),
            prompt_cache_retention: T.nilable(String),
            prompt_mode:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode::OrSymbol
              ),
            reasoning_effort: T.nilable(String),
            response_format:
              T.nilable(
                T.any(
                  DedalusSDK::ResponseFormatText::OrHash,
                  DedalusSDK::ResponseFormatJSONSchema::OrHash,
                  DedalusSDK::ResponseFormatJSONObject::OrHash
                )
              ),
            safe_prompt: T.nilable(T::Boolean),
            safety_identifier: T.nilable(String),
            safety_settings:
              T.nilable(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::OrHash
                ]
              ),
            search_parameters:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            seed: T.nilable(Integer),
            service_tier: T.nilable(String),
            speed:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::Speed::OrSymbol
              ),
            stop:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::Stop::Variants
              ),
            store: T.nilable(T::Boolean),
            stream_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            system_instruction:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction::Variants
              ),
            temperature: T.nilable(Float),
            thinking:
              T.nilable(
                T.any(
                  DedalusSDK::Chat::ThinkingConfigEnabled::OrHash,
                  DedalusSDK::Chat::ThinkingConfigDisabled::OrHash,
                  DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive::OrHash
                )
              ),
            tool_choice:
              T.nilable(
                T.any(
                  String,
                  DedalusSDK::Chat::ToolChoiceAuto::OrHash,
                  DedalusSDK::Chat::ToolChoiceAny::OrHash,
                  DedalusSDK::Chat::ToolChoiceTool::OrHash,
                  DedalusSDK::Chat::ToolChoiceNone::OrHash
                )
              ),
            tool_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            tools:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionToolParam::OrHash]
              ),
            top_k: T.nilable(Integer),
            top_logprobs: T.nilable(Integer),
            top_p: T.nilable(Float),
            user: T.nilable(String),
            verbosity: T.nilable(String),
            web_search_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            stream: T.noreturn,
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(DedalusSDK::Chat::ChatCompletion)
        end
        def create(
          # Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
          # objects with per-model settings.
          model:,
          # Agent attributes. Values in [0.0, 1.0].
          agent_attributes: nil,
          # Parameters for audio output. Required when audio output is requested with
          # `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
          #
          # Fields:
          #
          # - voice (required): VoiceIdsOrCustomVoice
          # - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
          audio: nil,
          # Execute tools server-side. If false, returns raw tool calls for manual handling.
          automatic_tool_execution: nil,
          # Optional. The name of the content
          # [cached](https://ai.google.dev/gemini-api/docs/caching) to use as context to
          # serve the prediction. Format: `cachedContents/{cachedContent}`
          cached_content: nil,
          # Stable session ID for resuming a previous handoff. Returned by the server on
          # handoff; echo it on the next request to resume.
          correlation_id: nil,
          # Credentials for MCP server authentication. Each credential is matched to servers
          # by connection name.
          credentials: nil,
          # If set to `true`, the request returns a `request_id`. You can then get the
          # deferred response by GET `/v1/chat/deferred-completion/{request_id}`.
          deferred: nil,
          # Tier 2 stateless resumption. Deferred tool specs from a previous handoff
          # response, sent back verbatim so the server can resume without Redis.
          deferred_calls: nil,
          # Number between -2.0 and 2.0. Positive values penalize new tokens based on their
          # existing frequency in the text so far, decreasing the model's likelihood to
          # repeat the same line verbatim.
          frequency_penalty: nil,
          # Deprecated in favor of `tool_choice`. Controls which (if any) function is called
          # by the model. `none` means the model will not call a function and instead
          # generates a message. `auto` means the model can pick between generating a
          # message or calling a function. Specifying a particular function via
          # `{"name": "my_function"}` forces the model to call that function. `none` is the
          # default when no functions are present. `auto` is the default if functions are
          # present.
          function_call: nil,
          # Deprecated in favor of `tools`. A list of functions the model may generate JSON
          # inputs for.
          functions: nil,
          # Generation parameters wrapper (Google-specific)
          generation_config: nil,
          # Content filtering and safety policy configuration.
          guardrails: nil,
          # Configuration for multi-model handoffs.
          handoff_config: nil,
          # Handoff control. None or omitted: auto-detect. true: structured handoff (SDK).
          # false: drop-in (LLM re-run for mixed turns).
          handoff_mode: nil,
          # Specifies the geographic region for inference processing. If not specified, the
          # workspace's `default_inference_geo` is used.
          inference_geo: nil,
          # Modify the likelihood of specified tokens appearing in the completion. Accepts a
          # JSON object that maps tokens (specified by their token ID in the tokenizer) to
          # an associated bias value from -100 to 100. Mathematically, the bias is added to
          # the logits generated by the model prior to sampling. The exact effect will vary
          # per model, but values between -1 and 1 should decrease or increase likelihood of
          # selection; values like -100 or 100 should result in a ban or exclusive selection
          # of the relevant token.
          logit_bias: nil,
          # Whether to return log probabilities of the output tokens or not. If true,
          # returns the log probabilities of each output token returned in the `content` of
          # `message`.
          logprobs: nil,
          # Maximum tokens in completion (newer parameter name)
          max_completion_tokens: nil,
          # Maximum tokens in completion
          max_tokens: nil,
          # Maximum conversation turns.
          max_turns: nil,
          # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
          # objects. MCP tools are executed server-side and billed separately.
          mcp_servers: nil,
          # Conversation history (OpenAI: messages, Google: contents, Responses: input)
          messages: nil,
          # Set of 16 key-value pairs that can be attached to an object. This can be useful
          # for storing additional information about the object in a structured format, and
          # querying for objects via API or the dashboard. Keys are strings with a maximum
          # length of 64 characters. Values are strings with a maximum length of 512
          # characters.
          metadata: nil,
          # Output types that you would like the model to generate. Most models are capable
          # of generating text, which is the default: `["text"]` The `gpt-4o-audio-preview`
          # model can also be used to [generate audio](/docs/guides/audio). To request that
          # this model generate both text and audio responses, you can use:
          # `["text", "audio"]`
          modalities: nil,
          # Model attributes for routing. Maps model IDs to attribute dictionaries with
          # values in [0.0, 1.0].
          model_attributes: nil,
          # How many chat completion choices to generate for each input message. Note that
          # you will be charged based on the number of generated tokens across all of the
          # choices. Keep `n` as `1` to minimize costs.
          n: nil,
          output_config: nil,
          # Whether to enable parallel tool calls (Anthropic uses inverted polarity).
          parallel_tool_calls: nil,
          # Static predicted output content, such as the content of a text file that is
          # being regenerated.
          #
          # Fields:
          #
          # - type (required): Literal["content"]
          # - content (required): str |
          #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
          #   ArrayTitle("PredictionContentArray")]
          prediction: nil,
          # Number between -2.0 and 2.0. Positive values penalize new tokens based on
          # whether they appear in the text so far, increasing the model's likelihood to
          # talk about new topics.
          presence_penalty: nil,
          # Used by OpenAI to cache responses for similar requests to optimize your cache
          # hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).
          prompt_cache_key: nil,
          # The retention policy for the prompt cache. Set to `24h` to enable extended
          # prompt caching, which keeps cached prefixes active for longer, up to a maximum
          # of 24 hours. [Learn more](/docs/guides/prompt-caching#prompt-cache-retention).
          prompt_cache_retention: nil,
          # Allows toggling between the reasoning mode and no system prompt. When set to
          # `reasoning` the system prompt for reasoning models will be used.
          prompt_mode: nil,
          # Constrains effort on reasoning for
          # [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently
          # supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`.
          # Reducing reasoning effort can result in faster responses and fewer tokens used
          # on reasoning in a response. - `gpt-5.1` defaults to `none`, which does not
          # perform reasoning. The supported reasoning values for `gpt-5.1` are `none`,
          # `low`, `medium`, and `high`. Tool calls are supported for all reasoning values
          # in gpt-5.1. - All models before `gpt-5.1` default to `medium` reasoning effort,
          # and do not support `none`. - The `gpt-5-pro` model defaults to (and only
          # supports) `high` reasoning effort. - `xhigh` is supported for all models after
          # `gpt-5.1-codex-max`.
          reasoning_effort: nil,
          # An object specifying the format that the model must output. Setting to
          # `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
          # which ensures the model will match your supplied JSON schema. Learn more in the
          # [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
          # `{ "type": "json_object" }` enables the older JSON mode, which ensures the
          # message the model generates is valid JSON. Using `json_schema` is preferred for
          # models that support it.
          response_format: nil,
          # Whether to inject a safety prompt before all conversations.
          safe_prompt: nil,
          # A stable identifier used to help detect users of your application that may be
          # violating OpenAI's usage policies. The IDs should be a string that uniquely
          # identifies each user. We recommend hashing their username or email address, in
          # order to avoid sending us any identifying information.
          # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
          safety_identifier: nil,
          # Safety/content filtering settings (Google-specific)
          safety_settings: nil,
          # Set the parameters to be used for searched data. If not set, no data will be
          # acquired by the model.
          search_parameters: nil,
          # Random seed for deterministic output
          seed: nil,
          # Service tier for request processing
          service_tier: nil,
          # The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          speed: nil,
          # Sequences that stop generation
          stop: nil,
          # Whether or not to store the output of this chat completion request for use in
          # our [model distillation](/docs/guides/distillation) or
          # [evals](/docs/guides/evals) products. Supports text and image inputs. Note:
          # image inputs over 8MB will be dropped.
          store: nil,
          # Options for streaming response. Only set this when you set `stream: true`.
          stream_options: nil,
          # System instruction/prompt
          system_instruction: nil,
          # Sampling temperature (0-2 for most providers)
          temperature: nil,
          # Extended thinking configuration (Anthropic-specific)
          thinking: nil,
          # Controls which (if any) tool is called by the model. `none` means the model will
          # not call any tool and instead generates a message. `auto` means the model can
          # pick between generating a message or calling one or more tools. `required` means
          # the model must call one or more tools. Specifying a particular tool via
          # `{"type": "function", "function": {"name": "my_function"}}` forces the model to
          # call that tool. `none` is the default when no tools are present. `auto` is the
          # default if tools are present.
          tool_choice: nil,
          # Tool calling configuration (Google-specific)
          tool_config: nil,
          # Available tools/functions for the model
          tools: nil,
          # Top-k sampling parameter
          top_k: nil,
          # An integer between 0 and 20 specifying the number of most likely tokens to
          # return at each token position, each with an associated log probability.
          # `logprobs` must be set to `true` if this parameter is used.
          top_logprobs: nil,
          # Nucleus sampling threshold
          top_p: nil,
          # This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
          # `prompt_cache_key` instead to maintain caching optimizations. A stable
          # identifier for your end-users. Used to boost cache hit rates by better bucketing
          # similar requests and to help OpenAI detect and prevent abuse.
          # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
          user: nil,
          # Constrains the verbosity of the model's response. Lower values will result in
          # more concise responses, while higher values will result in more verbose
          # responses. Currently supported values are `low`, `medium`, and `high`.
          verbosity: nil,
          # This tool searches the web for relevant results to use in a response. Learn more
          # about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).
          web_search_options: nil,
          # There is no need to provide `stream:`. Instead, use `#create_streaming` or
          # `#create` for streaming and non-streaming use cases, respectively.
          stream: false,
          request_options: {}
        )
        end

        # See {DedalusSDK::Resources::Chat::Completions#create} for non-streaming
        # counterpart.
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
        sig do
          params(
            model:
              T.any(
                String,
                DedalusSDK::DedalusModel::OrHash,
                T::Array[T.any(String, DedalusSDK::DedalusModel::OrHash)]
              ),
            agent_attributes: T.nilable(T::Hash[Symbol, Float]),
            audio:
              T.nilable(DedalusSDK::Chat::ChatCompletionAudioParam::OrHash),
            automatic_tool_execution: T::Boolean,
            cached_content: T.nilable(String),
            correlation_id: T.nilable(String),
            credentials:
              T.nilable(
                T.any(
                  DedalusSDK::Credential::OrHash,
                  T::Array[DedalusSDK::Credential::OrHash]
                )
              ),
            deferred: T.nilable(T::Boolean),
            deferred_calls:
              T.nilable(
                T::Array[DedalusSDK::Chat::DeferredCallResponse::OrHash]
              ),
            frequency_penalty: T.nilable(Float),
            function_call: T.nilable(String),
            functions:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionFunctions::OrHash]
              ),
            generation_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            guardrails: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
            handoff_config: T.nilable(T::Hash[Symbol, T.anything]),
            handoff_mode: T.nilable(T::Boolean),
            inference_geo: T.nilable(String),
            logit_bias: T.nilable(T::Hash[Symbol, Integer]),
            logprobs: T.nilable(T::Boolean),
            max_completion_tokens: T.nilable(Integer),
            max_tokens: T.nilable(Integer),
            max_turns: T.nilable(Integer),
            mcp_servers:
              T.nilable(
                T.any(
                  String,
                  DedalusSDK::MCPServerSpec::OrHash,
                  T::Array[T.any(String, DedalusSDK::MCPServerSpec::OrHash)]
                )
              ),
            messages:
              T.nilable(
                T::Array[
                  T.any(
                    DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionSystemMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionUserMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionAssistantMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionToolMessageParam::OrHash,
                    DedalusSDK::Chat::ChatCompletionFunctionMessageParam::OrHash
                  )
                ]
              ),
            metadata:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            modalities: T.nilable(T::Array[String]),
            model_attributes:
              T.nilable(T::Hash[Symbol, T::Hash[Symbol, Float]]),
            n: T.nilable(Integer),
            output_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            parallel_tool_calls: T.nilable(T::Boolean),
            prediction: T.nilable(DedalusSDK::Chat::PredictionContent::OrHash),
            presence_penalty: T.nilable(Float),
            prompt_cache_key: T.nilable(String),
            prompt_cache_retention: T.nilable(String),
            prompt_mode:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode::OrSymbol
              ),
            reasoning_effort: T.nilable(String),
            response_format:
              T.nilable(
                T.any(
                  DedalusSDK::ResponseFormatText::OrHash,
                  DedalusSDK::ResponseFormatJSONSchema::OrHash,
                  DedalusSDK::ResponseFormatJSONObject::OrHash
                )
              ),
            safe_prompt: T.nilable(T::Boolean),
            safety_identifier: T.nilable(String),
            safety_settings:
              T.nilable(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::OrHash
                ]
              ),
            search_parameters:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            seed: T.nilable(Integer),
            service_tier: T.nilable(String),
            speed:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::Speed::OrSymbol
              ),
            stop:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::Stop::Variants
              ),
            store: T.nilable(T::Boolean),
            stream_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            system_instruction:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction::Variants
              ),
            temperature: T.nilable(Float),
            thinking:
              T.nilable(
                T.any(
                  DedalusSDK::Chat::ThinkingConfigEnabled::OrHash,
                  DedalusSDK::Chat::ThinkingConfigDisabled::OrHash,
                  DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive::OrHash
                )
              ),
            tool_choice:
              T.nilable(
                T.any(
                  String,
                  DedalusSDK::Chat::ToolChoiceAuto::OrHash,
                  DedalusSDK::Chat::ToolChoiceAny::OrHash,
                  DedalusSDK::Chat::ToolChoiceTool::OrHash,
                  DedalusSDK::Chat::ToolChoiceNone::OrHash
                )
              ),
            tool_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            tools:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionToolParam::OrHash]
              ),
            top_k: T.nilable(Integer),
            top_logprobs: T.nilable(Integer),
            top_p: T.nilable(Float),
            user: T.nilable(String),
            verbosity: T.nilable(String),
            web_search_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            stream: T.noreturn,
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(
            DedalusSDK::Internal::Stream[DedalusSDK::Chat::ChatCompletionChunk]
          )
        end
        def create_streaming(
          # Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
          # objects with per-model settings.
          model:,
          # Agent attributes. Values in [0.0, 1.0].
          agent_attributes: nil,
          # Parameters for audio output. Required when audio output is requested with
          # `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
          #
          # Fields:
          #
          # - voice (required): VoiceIdsOrCustomVoice
          # - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
          audio: nil,
          # Execute tools server-side. If false, returns raw tool calls for manual handling.
          automatic_tool_execution: nil,
          # Optional. The name of the content
          # [cached](https://ai.google.dev/gemini-api/docs/caching) to use as context to
          # serve the prediction. Format: `cachedContents/{cachedContent}`
          cached_content: nil,
          # Stable session ID for resuming a previous handoff. Returned by the server on
          # handoff; echo it on the next request to resume.
          correlation_id: nil,
          # Credentials for MCP server authentication. Each credential is matched to servers
          # by connection name.
          credentials: nil,
          # If set to `true`, the request returns a `request_id`. You can then get the
          # deferred response by GET `/v1/chat/deferred-completion/{request_id}`.
          deferred: nil,
          # Tier 2 stateless resumption. Deferred tool specs from a previous handoff
          # response, sent back verbatim so the server can resume without Redis.
          deferred_calls: nil,
          # Number between -2.0 and 2.0. Positive values penalize new tokens based on their
          # existing frequency in the text so far, decreasing the model's likelihood to
          # repeat the same line verbatim.
          frequency_penalty: nil,
          # Deprecated in favor of `tool_choice`. Controls which (if any) function is called
          # by the model. `none` means the model will not call a function and instead
          # generates a message. `auto` means the model can pick between generating a
          # message or calling a function. Specifying a particular function via
          # `{"name": "my_function"}` forces the model to call that function. `none` is the
          # default when no functions are present. `auto` is the default if functions are
          # present.
          function_call: nil,
          # Deprecated in favor of `tools`. A list of functions the model may generate JSON
          # inputs for.
          functions: nil,
          # Generation parameters wrapper (Google-specific)
          generation_config: nil,
          # Content filtering and safety policy configuration.
          guardrails: nil,
          # Configuration for multi-model handoffs.
          handoff_config: nil,
          # Handoff control. None or omitted: auto-detect. true: structured handoff (SDK).
          # false: drop-in (LLM re-run for mixed turns).
          handoff_mode: nil,
          # Specifies the geographic region for inference processing. If not specified, the
          # workspace's `default_inference_geo` is used.
          inference_geo: nil,
          # Modify the likelihood of specified tokens appearing in the completion. Accepts a
          # JSON object that maps tokens (specified by their token ID in the tokenizer) to
          # an associated bias value from -100 to 100. Mathematically, the bias is added to
          # the logits generated by the model prior to sampling. The exact effect will vary
          # per model, but values between -1 and 1 should decrease or increase likelihood of
          # selection; values like -100 or 100 should result in a ban or exclusive selection
          # of the relevant token.
          logit_bias: nil,
          # Whether to return log probabilities of the output tokens or not. If true,
          # returns the log probabilities of each output token returned in the `content` of
          # `message`.
          logprobs: nil,
          # Maximum tokens in completion (newer parameter name)
          max_completion_tokens: nil,
          # Maximum tokens in completion
          max_tokens: nil,
          # Maximum conversation turns.
          max_turns: nil,
          # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
          # objects. MCP tools are executed server-side and billed separately.
          mcp_servers: nil,
          # Conversation history (OpenAI: messages, Google: contents, Responses: input)
          messages: nil,
          # Set of 16 key-value pairs that can be attached to an object. This can be useful
          # for storing additional information about the object in a structured format, and
          # querying for objects via API or the dashboard. Keys are strings with a maximum
          # length of 64 characters. Values are strings with a maximum length of 512
          # characters.
          metadata: nil,
          # Output types that you would like the model to generate. Most models are capable
          # of generating text, which is the default: `["text"]` The `gpt-4o-audio-preview`
          # model can also be used to [generate audio](/docs/guides/audio). To request that
          # this model generate both text and audio responses, you can use:
          # `["text", "audio"]`
          modalities: nil,
          # Model attributes for routing. Maps model IDs to attribute dictionaries with
          # values in [0.0, 1.0].
          model_attributes: nil,
          # How many chat completion choices to generate for each input message. Note that
          # you will be charged based on the number of generated tokens across all of the
          # choices. Keep `n` as `1` to minimize costs.
          n: nil,
          output_config: nil,
          # Whether to enable parallel tool calls (Anthropic uses inverted polarity).
          parallel_tool_calls: nil,
          # Static predicted output content, such as the content of a text file that is
          # being regenerated.
          #
          # Fields:
          #
          # - type (required): Literal["content"]
          # - content (required): str |
          #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
          #   ArrayTitle("PredictionContentArray")]
          prediction: nil,
          # Number between -2.0 and 2.0. Positive values penalize new tokens based on
          # whether they appear in the text so far, increasing the model's likelihood to
          # talk about new topics.
          presence_penalty: nil,
          # Used by OpenAI to cache responses for similar requests to optimize your cache
          # hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).
          prompt_cache_key: nil,
          # The retention policy for the prompt cache. Set to `24h` to enable extended
          # prompt caching, which keeps cached prefixes active for longer, up to a maximum
          # of 24 hours. [Learn more](/docs/guides/prompt-caching#prompt-cache-retention).
          prompt_cache_retention: nil,
          # Allows toggling between the reasoning mode and no system prompt. When set to
          # `reasoning` the system prompt for reasoning models will be used.
          prompt_mode: nil,
          # Constrains effort on reasoning for
          # [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently
          # supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`.
          # Reducing reasoning effort can result in faster responses and fewer tokens used
          # on reasoning in a response. - `gpt-5.1` defaults to `none`, which does not
          # perform reasoning. The supported reasoning values for `gpt-5.1` are `none`,
          # `low`, `medium`, and `high`. Tool calls are supported for all reasoning values
          # in gpt-5.1. - All models before `gpt-5.1` default to `medium` reasoning effort,
          # and do not support `none`. - The `gpt-5-pro` model defaults to (and only
          # supports) `high` reasoning effort. - `xhigh` is supported for all models after
          # `gpt-5.1-codex-max`.
          reasoning_effort: nil,
          # An object specifying the format that the model must output. Setting to
          # `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
          # which ensures the model will match your supplied JSON schema. Learn more in the
          # [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
          # `{ "type": "json_object" }` enables the older JSON mode, which ensures the
          # message the model generates is valid JSON. Using `json_schema` is preferred for
          # models that support it.
          response_format: nil,
          # Whether to inject a safety prompt before all conversations.
          safe_prompt: nil,
          # A stable identifier used to help detect users of your application that may be
          # violating OpenAI's usage policies. The IDs should be a string that uniquely
          # identifies each user. We recommend hashing their username or email address, in
          # order to avoid sending us any identifying information.
          # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
          safety_identifier: nil,
          # Safety/content filtering settings (Google-specific)
          safety_settings: nil,
          # Set the parameters to be used for searched data. If not set, no data will be
          # acquired by the model.
          search_parameters: nil,
          # Random seed for deterministic output
          seed: nil,
          # Service tier for request processing
          service_tier: nil,
          # The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          speed: nil,
          # Sequences that stop generation
          stop: nil,
          # Whether or not to store the output of this chat completion request for use in
          # our [model distillation](/docs/guides/distillation) or
          # [evals](/docs/guides/evals) products. Supports text and image inputs. Note:
          # image inputs over 8MB will be dropped.
          store: nil,
          # Options for streaming response. Only set this when you set `stream: true`.
          stream_options: nil,
          # System instruction/prompt
          system_instruction: nil,
          # Sampling temperature (0-2 for most providers)
          temperature: nil,
          # Extended thinking configuration (Anthropic-specific)
          thinking: nil,
          # Controls which (if any) tool is called by the model. `none` means the model will
          # not call any tool and instead generates a message. `auto` means the model can
          # pick between generating a message or calling one or more tools. `required` means
          # the model must call one or more tools. Specifying a particular tool via
          # `{"type": "function", "function": {"name": "my_function"}}` forces the model to
          # call that tool. `none` is the default when no tools are present. `auto` is the
          # default if tools are present.
          tool_choice: nil,
          # Tool calling configuration (Google-specific)
          tool_config: nil,
          # Available tools/functions for the model
          tools: nil,
          # Top-k sampling parameter
          top_k: nil,
          # An integer between 0 and 20 specifying the number of most likely tokens to
          # return at each token position, each with an associated log probability.
          # `logprobs` must be set to `true` if this parameter is used.
          top_logprobs: nil,
          # Nucleus sampling threshold
          top_p: nil,
          # This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
          # `prompt_cache_key` instead to maintain caching optimizations. A stable
          # identifier for your end-users. Used to boost cache hit rates by better bucketing
          # similar requests and to help OpenAI detect and prevent abuse.
          # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
          user: nil,
          # Constrains the verbosity of the model's response. Lower values will result in
          # more concise responses, while higher values will result in more verbose
          # responses. Currently supported values are `low`, `medium`, and `high`.
          verbosity: nil,
          # This tool searches the web for relevant results to use in a response. Learn more
          # about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).
          web_search_options: nil,
          # There is no need to provide `stream:`. Instead, use `#create_streaming` or
          # `#create` for streaming and non-streaming use cases, respectively.
          stream: true,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: DedalusSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
