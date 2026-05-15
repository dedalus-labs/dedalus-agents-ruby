# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionCreateParams < DedalusSDK::Internal::Type::BaseModel
        # @!attribute model
        #   Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
        #   objects with per-model settings.
        #
        #   @return [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>]
        required :model, union: -> { DedalusSDK::Chat::ChatCompletionCreateParams::Model }

        # @!attribute agent_attributes
        #   Agent attributes. Values in [0.0, 1.0].
        #
        #   @return [Hash{Symbol=>Float}, nil]
        optional :agent_attributes, DedalusSDK::Internal::Type::HashOf[Float], nil?: true

        # @!attribute audio
        #   Parameters for audio output. Required when audio output is requested with
        #   `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
        #
        #   Fields:
        #
        #   - voice (required): VoiceIdsOrCustomVoice
        #   - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
        #
        #   @return [DedalusSDK::Models::Chat::ChatCompletionAudioParam, nil]
        optional :audio, -> { DedalusSDK::Chat::ChatCompletionAudioParam }, nil?: true

        # @!attribute automatic_tool_execution
        #   Execute tools server-side. If false, returns raw tool calls for manual handling.
        #
        #   @return [Boolean, nil]
        optional :automatic_tool_execution, DedalusSDK::Internal::Type::Boolean

        # @!attribute cached_content
        #   Optional. The name of the content
        #   [cached](https://ai.google.dev/gemini-api/docs/caching) to use as context to
        #   serve the prediction. Format: `cachedContents/{cachedContent}`
        #
        #   @return [String, nil]
        optional :cached_content, String, nil?: true

        # @!attribute correlation_id
        #   Stable session ID for resuming a previous handoff. Returned by the server on
        #   handoff; echo it on the next request to resume.
        #
        #   @return [String, nil]
        optional :correlation_id, String, nil?: true

        # @!attribute credentials
        #   Credentials for MCP server authentication. Each credential is matched to servers
        #   by connection name.
        #
        #   @return [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil]
        optional :credentials,
                 union: -> {
                   DedalusSDK::Chat::ChatCompletionCreateParams::Credentials
                 },
                 nil?: true

        # @!attribute deferred
        #   If set to `true`, the request returns a `request_id`. You can then get the
        #   deferred response by GET `/v1/chat/deferred-completion/{request_id}`.
        #
        #   @return [Boolean, nil]
        optional :deferred, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute deferred_calls
        #   Tier 2 stateless resumption. Deferred tool specs from a previous handoff
        #   response, sent back verbatim so the server can resume without Redis.
        #
        #   @return [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil]
        optional :deferred_calls,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::DeferredCallResponse] },
                 nil?: true

        # @!attribute frequency_penalty
        #   Number between -2.0 and 2.0. Positive values penalize new tokens based on their
        #   existing frequency in the text so far, decreasing the model's likelihood to
        #   repeat the same line verbatim.
        #
        #   @return [Float, nil]
        optional :frequency_penalty, Float, nil?: true

        # @!attribute function_call
        #   Deprecated in favor of `tool_choice`. Controls which (if any) function is called
        #   by the model. `none` means the model will not call a function and instead
        #   generates a message. `auto` means the model can pick between generating a
        #   message or calling a function. Specifying a particular function via
        #   `{"name": "my_function"}` forces the model to call that function. `none` is the
        #   default when no functions are present. `auto` is the default if functions are
        #   present.
        #
        #   @return [String, nil]
        optional :function_call, String, nil?: true

        # @!attribute functions
        #   Deprecated in favor of `tools`. A list of functions the model may generate JSON
        #   inputs for.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionFunctions>, nil]
        optional :functions,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionFunctions] },
                 nil?: true

        # @!attribute generation_config
        #   Generation parameters wrapper (Google-specific)
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :generation_config,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute guardrails
        #   Content filtering and safety policy configuration.
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :guardrails,
                 DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute handoff_config
        #   Configuration for multi-model handoffs.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :handoff_config,
                 DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown],
                 nil?: true

        # @!attribute handoff_mode
        #   Handoff control. None or omitted: auto-detect. true: structured handoff (SDK).
        #   false: drop-in (LLM re-run for mixed turns).
        #
        #   @return [Boolean, nil]
        optional :handoff_mode, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute inference_geo
        #   Specifies the geographic region for inference processing. If not specified, the
        #   workspace's `default_inference_geo` is used.
        #
        #   @return [String, nil]
        optional :inference_geo, String, nil?: true

        # @!attribute logit_bias
        #   Modify the likelihood of specified tokens appearing in the completion. Accepts a
        #   JSON object that maps tokens (specified by their token ID in the tokenizer) to
        #   an associated bias value from -100 to 100. Mathematically, the bias is added to
        #   the logits generated by the model prior to sampling. The exact effect will vary
        #   per model, but values between -1 and 1 should decrease or increase likelihood of
        #   selection; values like -100 or 100 should result in a ban or exclusive selection
        #   of the relevant token.
        #
        #   @return [Hash{Symbol=>Integer}, nil]
        optional :logit_bias, DedalusSDK::Internal::Type::HashOf[Integer], nil?: true

        # @!attribute logprobs
        #   Whether to return log probabilities of the output tokens or not. If true,
        #   returns the log probabilities of each output token returned in the `content` of
        #   `message`.
        #
        #   @return [Boolean, nil]
        optional :logprobs, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute max_completion_tokens
        #   Maximum tokens in completion (newer parameter name)
        #
        #   @return [Integer, nil]
        optional :max_completion_tokens, Integer, nil?: true

        # @!attribute max_tokens
        #   Maximum tokens in completion
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, nil?: true

        # @!attribute max_turns
        #   Maximum conversation turns.
        #
        #   @return [Integer, nil]
        optional :max_turns, Integer, nil?: true

        # @!attribute mcp_servers
        #   MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
        #   objects. MCP tools are executed server-side and billed separately.
        #
        #   @return [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil]
        optional :mcp_servers,
                 union: -> {
                   DedalusSDK::Chat::ChatCompletionCreateParams::MCPServers
                 },
                 nil?: true

        # @!attribute messages
        #   Conversation history (OpenAI: messages, Google: contents, Responses: input)
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam, DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam, DedalusSDK::Models::Chat::ChatCompletionUserMessageParam, DedalusSDK::Models::Chat::ChatCompletionAssistantMessageParam, DedalusSDK::Models::Chat::ChatCompletionToolMessageParam, DedalusSDK::Models::Chat::ChatCompletionFunctionMessageParam>, nil]
        optional :messages,
                 -> {
                   DedalusSDK::Internal::Type::ArrayOf[union: DedalusSDK::Chat::ChatCompletionCreateParams::Message]
                 },
                 nil?: true

        # @!attribute metadata
        #   Set of 16 key-value pairs that can be attached to an object. This can be useful
        #   for storing additional information about the object in a structured format, and
        #   querying for objects via API or the dashboard. Keys are strings with a maximum
        #   length of 64 characters. Values are strings with a maximum length of 512
        #   characters.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :metadata,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute modalities
        #   Output types that you would like the model to generate. Most models are capable
        #   of generating text, which is the default: `["text"]` The `gpt-4o-audio-preview`
        #   model can also be used to [generate audio](/docs/guides/audio). To request that
        #   this model generate both text and audio responses, you can use:
        #   `["text", "audio"]`
        #
        #   @return [Array<String>, nil]
        optional :modalities, DedalusSDK::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute model_attributes
        #   Model attributes for routing. Maps model IDs to attribute dictionaries with
        #   values in [0.0, 1.0].
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Float}}, nil]
        optional :model_attributes,
                 DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::HashOf[Float]],
                 nil?: true

        # @!attribute n
        #   How many chat completion choices to generate for each input message. Note that
        #   you will be charged based on the number of generated tokens across all of the
        #   choices. Keep `n` as `1` to minimize costs.
        #
        #   @return [Integer, nil]
        optional :n, Integer, nil?: true

        # @!attribute output_config
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :output_config,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute parallel_tool_calls
        #   Whether to enable parallel tool calls (Anthropic uses inverted polarity).
        #
        #   @return [Boolean, nil]
        optional :parallel_tool_calls, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute prediction
        #   Static predicted output content, such as the content of a text file that is
        #   being regenerated.
        #
        #   Fields:
        #
        #   - type (required): Literal["content"]
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #     ArrayTitle("PredictionContentArray")]
        #
        #   @return [DedalusSDK::Models::Chat::PredictionContent, nil]
        optional :prediction, -> { DedalusSDK::Chat::PredictionContent }, nil?: true

        # @!attribute presence_penalty
        #   Number between -2.0 and 2.0. Positive values penalize new tokens based on
        #   whether they appear in the text so far, increasing the model's likelihood to
        #   talk about new topics.
        #
        #   @return [Float, nil]
        optional :presence_penalty, Float, nil?: true

        # @!attribute prompt_cache_key
        #   Used by OpenAI to cache responses for similar requests to optimize your cache
        #   hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).
        #
        #   @return [String, nil]
        optional :prompt_cache_key, String, nil?: true

        # @!attribute prompt_cache_retention
        #   The retention policy for the prompt cache. Set to `24h` to enable extended
        #   prompt caching, which keeps cached prefixes active for longer, up to a maximum
        #   of 24 hours. [Learn more](/docs/guides/prompt-caching#prompt-cache-retention).
        #
        #   @return [String, nil]
        optional :prompt_cache_retention, String, nil?: true

        # @!attribute prompt_mode
        #   Allows toggling between the reasoning mode and no system prompt. When set to
        #   `reasoning` the system prompt for reasoning models will be used.
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::PromptMode, nil]
        optional :prompt_mode,
                 enum: -> {
                   DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode
                 },
                 nil?: true

        # @!attribute reasoning_effort
        #   Constrains effort on reasoning for
        #   [reasoning models](https://platform.openai.com/docs/guides/reasoning). Currently
        #   supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`.
        #   Reducing reasoning effort can result in faster responses and fewer tokens used
        #   on reasoning in a response. - `gpt-5.1` defaults to `none`, which does not
        #   perform reasoning. The supported reasoning values for `gpt-5.1` are `none`,
        #   `low`, `medium`, and `high`. Tool calls are supported for all reasoning values
        #   in gpt-5.1. - All models before `gpt-5.1` default to `medium` reasoning effort,
        #   and do not support `none`. - The `gpt-5-pro` model defaults to (and only
        #   supports) `high` reasoning effort. - `xhigh` is supported for all models after
        #   `gpt-5.1-codex-max`.
        #
        #   @return [String, nil]
        optional :reasoning_effort, String, nil?: true

        # @!attribute response_format
        #   An object specifying the format that the model must output. Setting to
        #   `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
        #   which ensures the model will match your supplied JSON schema. Learn more in the
        #   [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
        #   `{ "type": "json_object" }` enables the older JSON mode, which ensures the
        #   message the model generates is valid JSON. Using `json_schema` is preferred for
        #   models that support it.
        #
        #   @return [DedalusSDK::Models::ResponseFormatText, DedalusSDK::Models::ResponseFormatJSONSchema, DedalusSDK::Models::ResponseFormatJSONObject, nil]
        optional :response_format,
                 union: -> { DedalusSDK::Chat::ChatCompletionCreateParams::ResponseFormat },
                 nil?: true

        # @!attribute safe_prompt
        #   Whether to inject a safety prompt before all conversations.
        #
        #   @return [Boolean, nil]
        optional :safe_prompt, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute safety_identifier
        #   A stable identifier used to help detect users of your application that may be
        #   violating OpenAI's usage policies. The IDs should be a string that uniquely
        #   identifies each user. We recommend hashing their username or email address, in
        #   order to avoid sending us any identifying information.
        #   [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
        #
        #   @return [String, nil]
        optional :safety_identifier, String, nil?: true

        # @!attribute safety_settings
        #   Safety/content filtering settings (Google-specific)
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting>, nil]
        optional :safety_settings,
                 -> {
                   DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting]
                 },
                 nil?: true

        # @!attribute search_parameters
        #   Set the parameters to be used for searched data. If not set, no data will be
        #   acquired by the model.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :search_parameters,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute seed
        #   Random seed for deterministic output
        #
        #   @return [Integer, nil]
        optional :seed, Integer, nil?: true

        # @!attribute service_tier
        #   Service tier for request processing
        #
        #   @return [String, nil]
        optional :service_tier, String, nil?: true

        # @!attribute speed
        #   The inference speed mode for this request. `"fast"` enables high
        #   output-tokens-per-second inference.
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Speed, nil]
        optional :speed, enum: -> { DedalusSDK::Chat::ChatCompletionCreateParams::Speed }, nil?: true

        # @!attribute stop
        #   Sequences that stop generation
        #
        #   @return [Array<String>, String, nil]
        optional :stop, union: -> { DedalusSDK::Chat::ChatCompletionCreateParams::Stop }, nil?: true

        # @!attribute store
        #   Whether or not to store the output of this chat completion request for use in
        #   our [model distillation](/docs/guides/distillation) or
        #   [evals](/docs/guides/evals) products. Supports text and image inputs. Note:
        #   image inputs over 8MB will be dropped.
        #
        #   @return [Boolean, nil]
        optional :store, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute stream
        #   Enable streaming response
        #
        #   @return [Boolean, nil]
        optional :stream, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute stream_options
        #   Options for streaming response. Only set this when you set `stream: true`.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :stream_options,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute system_instruction
        #   System instruction/prompt
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, String, nil]
        optional :system_instruction,
                 union: -> { DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction },
                 nil?: true

        # @!attribute temperature
        #   Sampling temperature (0-2 for most providers)
        #
        #   @return [Float, nil]
        optional :temperature, Float, nil?: true

        # @!attribute thinking
        #   Extended thinking configuration (Anthropic-specific)
        #
        #   @return [DedalusSDK::Models::Chat::ThinkingConfigEnabled, DedalusSDK::Models::Chat::ThinkingConfigDisabled, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Thinking::Adaptive, nil]
        optional :thinking, union: -> { DedalusSDK::Chat::ChatCompletionCreateParams::Thinking }, nil?: true

        # @!attribute tool_choice
        #   Controls which (if any) tool is called by the model. `none` means the model will
        #   not call any tool and instead generates a message. `auto` means the model can
        #   pick between generating a message or calling one or more tools. `required` means
        #   the model must call one or more tools. Specifying a particular tool via
        #   `{"type": "function", "function": {"name": "my_function"}}` forces the model to
        #   call that tool. `none` is the default when no tools are present. `auto` is the
        #   default if tools are present.
        #
        #   @return [String, DedalusSDK::Models::Chat::ToolChoiceAuto, DedalusSDK::Models::Chat::ToolChoiceAny, DedalusSDK::Models::Chat::ToolChoiceTool, DedalusSDK::Models::Chat::ToolChoiceNone, nil]
        optional :tool_choice,
                 union: -> {
                   DedalusSDK::Chat::ChatCompletionCreateParams::ToolChoice
                 },
                 nil?: true

        # @!attribute tool_config
        #   Tool calling configuration (Google-specific)
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :tool_config,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute tools
        #   Available tools/functions for the model
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionToolParam>, nil]
        optional :tools,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionToolParam] },
                 nil?: true

        # @!attribute top_k
        #   Top-k sampling parameter
        #
        #   @return [Integer, nil]
        optional :top_k, Integer, nil?: true

        # @!attribute top_logprobs
        #   An integer between 0 and 20 specifying the number of most likely tokens to
        #   return at each token position, each with an associated log probability.
        #   `logprobs` must be set to `true` if this parameter is used.
        #
        #   @return [Integer, nil]
        optional :top_logprobs, Integer, nil?: true

        # @!attribute top_p
        #   Nucleus sampling threshold
        #
        #   @return [Float, nil]
        optional :top_p, Float, nil?: true

        # @!attribute user
        #   This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        #   `prompt_cache_key` instead to maintain caching optimizations. A stable
        #   identifier for your end-users. Used to boost cache hit rates by better bucketing
        #   similar requests and to help OpenAI detect and prevent abuse.
        #   [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
        #
        #   @return [String, nil]
        optional :user, String, nil?: true

        # @!attribute verbosity
        #   Constrains the verbosity of the model's response. Lower values will result in
        #   more concise responses, while higher values will result in more verbose
        #   responses. Currently supported values are `low`, `medium`, and `high`.
        #
        #   @return [String, nil]
        optional :verbosity, String, nil?: true

        # @!attribute web_search_options
        #   This tool searches the web for relevant results to use in a response. Learn more
        #   about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :web_search_options,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!method initialize(model:, agent_attributes: nil, audio: nil, automatic_tool_execution: nil, cached_content: nil, correlation_id: nil, credentials: nil, deferred: nil, deferred_calls: nil, frequency_penalty: nil, function_call: nil, functions: nil, generation_config: nil, guardrails: nil, handoff_config: nil, handoff_mode: nil, inference_geo: nil, logit_bias: nil, logprobs: nil, max_completion_tokens: nil, max_tokens: nil, max_turns: nil, mcp_servers: nil, messages: nil, metadata: nil, modalities: nil, model_attributes: nil, n: nil, output_config: nil, parallel_tool_calls: nil, prediction: nil, presence_penalty: nil, prompt_cache_key: nil, prompt_cache_retention: nil, prompt_mode: nil, reasoning_effort: nil, response_format: nil, safe_prompt: nil, safety_identifier: nil, safety_settings: nil, search_parameters: nil, seed: nil, service_tier: nil, speed: nil, stop: nil, store: nil, stream: nil, stream_options: nil, system_instruction: nil, temperature: nil, thinking: nil, tool_choice: nil, tool_config: nil, tools: nil, top_k: nil, top_logprobs: nil, top_p: nil, user: nil, verbosity: nil, web_search_options: nil)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionCreateParams} for more details.
        #
        #   ChatCompletion request schema.
        #
        #   Supports OpenAI-compatible parameters, provider-specific extensions, server-side
        #   execution, and agent orchestration features.
        #
        #   @param model [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>] Model identifier. Accepts model ID strings, lists for routing, or DedalusModel o
        #
        #   @param agent_attributes [Hash{Symbol=>Float}, nil] Agent attributes. Values in [0.0, 1.0].
        #
        #   @param audio [DedalusSDK::Models::Chat::ChatCompletionAudioParam, nil] Parameters for audio output. Required when audio output is requested with
        #
        #   @param automatic_tool_execution [Boolean] Execute tools server-side. If false, returns raw tool calls for manual handling.
        #
        #   @param cached_content [String, nil] Optional. The name of the content [cached](https://ai.google.dev/gemini-api/docs
        #
        #   @param correlation_id [String, nil] Stable session ID for resuming a previous handoff. Returned by the server on han
        #
        #   @param credentials [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil] Credentials for MCP server authentication. Each credential is matched to servers
        #
        #   @param deferred [Boolean, nil] If set to `true`, the request returns a `request_id`. You can then get the defer
        #
        #   @param deferred_calls [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil] Tier 2 stateless resumption. Deferred tool specs from a previous handoff respons
        #
        #   @param frequency_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on their
        #
        #   @param function_call [String, nil] Deprecated in favor of `tool_choice`. Controls which (if any) function is calle
        #
        #   @param functions [Array<DedalusSDK::Models::Chat::ChatCompletionFunctions>, nil] Deprecated in favor of `tools`. A list of functions the model may generate JSON
        #
        #   @param generation_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Generation parameters wrapper (Google-specific)
        #
        #   @param guardrails [Array<Hash{Symbol=>Object}>, nil] Content filtering and safety policy configuration.
        #
        #   @param handoff_config [Hash{Symbol=>Object}, nil] Configuration for multi-model handoffs.
        #
        #   @param handoff_mode [Boolean, nil] Handoff control. None or omitted: auto-detect. true: structured handoff (SDK). f
        #
        #   @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
        #
        #   @param logit_bias [Hash{Symbol=>Integer}, nil] Modify the likelihood of specified tokens appearing in the completion. Accepts
        #
        #   @param logprobs [Boolean, nil] Whether to return log probabilities of the output tokens or not. If true, return
        #
        #   @param max_completion_tokens [Integer, nil] Maximum tokens in completion (newer parameter name)
        #
        #   @param max_tokens [Integer, nil] Maximum tokens in completion
        #
        #   @param max_turns [Integer, nil] Maximum conversation turns.
        #
        #   @param mcp_servers [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil] MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec object
        #
        #   @param messages [Array<DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam, DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam, DedalusSDK::Models::Chat::ChatCompletionUserMessageParam, DedalusSDK::Models::Chat::ChatCompletionAssistantMessageParam, DedalusSDK::Models::Chat::ChatCompletionToolMessageParam, DedalusSDK::Models::Chat::ChatCompletionFunctionMessageParam>, nil] Conversation history (OpenAI: messages, Google: contents, Responses: input)
        #
        #   @param metadata [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set of 16 key-value pairs that can be attached to an object. This can be useful
        #
        #   @param modalities [Array<String>, nil] Output types that you would like the model to generate. Most models are capable
        #
        #   @param model_attributes [Hash{Symbol=>Hash{Symbol=>Float}}, nil] Model attributes for routing. Maps model IDs to attribute dictionaries with valu
        #
        #   @param n [Integer, nil] How many chat completion choices to generate for each input message. Note that y
        #
        #   @param output_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        #
        #   @param parallel_tool_calls [Boolean, nil] Whether to enable parallel tool calls (Anthropic uses inverted polarity).
        #
        #   @param prediction [DedalusSDK::Models::Chat::PredictionContent, nil] Static predicted output content, such as the content of a text file that is
        #
        #   @param presence_penalty [Float, nil] Number between -2.0 and 2.0. Positive values penalize new tokens based on whethe
        #
        #   @param prompt_cache_key [String, nil] Used by OpenAI to cache responses for similar requests to optimize your cache hi
        #
        #   @param prompt_cache_retention [String, nil] The retention policy for the prompt cache. Set to `24h` to enable extended promp
        #
        #   @param prompt_mode [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::PromptMode, nil] Allows toggling between the reasoning mode and no system prompt. When set to `re
        #
        #   @param reasoning_effort [String, nil] Constrains effort on reasoning for [reasoning models](https://platform.openai.co
        #
        #   @param response_format [DedalusSDK::Models::ResponseFormatText, DedalusSDK::Models::ResponseFormatJSONSchema, DedalusSDK::Models::ResponseFormatJSONObject, nil] An object specifying the format that the model must output. Setting to `{ "type
        #
        #   @param safe_prompt [Boolean, nil] Whether to inject a safety prompt before all conversations.
        #
        #   @param safety_identifier [String, nil] A stable identifier used to help detect users of your application that may be vi
        #
        #   @param safety_settings [Array<DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting>, nil] Safety/content filtering settings (Google-specific)
        #
        #   @param search_parameters [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Set the parameters to be used for searched data. If not set, no data will be acq
        #
        #   @param seed [Integer, nil] Random seed for deterministic output
        #
        #   @param service_tier [String, nil] Service tier for request processing
        #
        #   @param speed [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
        #
        #   @param stop [Array<String>, String, nil] Sequences that stop generation
        #
        #   @param store [Boolean, nil] Whether or not to store the output of this chat completion request for use in ou
        #
        #   @param stream [Boolean, nil] Enable streaming response
        #
        #   @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Options for streaming response. Only set this when you set `stream: true`.
        #
        #   @param system_instruction [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, String, nil] System instruction/prompt
        #
        #   @param temperature [Float, nil] Sampling temperature (0-2 for most providers)
        #
        #   @param thinking [DedalusSDK::Models::Chat::ThinkingConfigEnabled, DedalusSDK::Models::Chat::ThinkingConfigDisabled, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Thinking::Adaptive, nil] Extended thinking configuration (Anthropic-specific)
        #
        #   @param tool_choice [String, DedalusSDK::Models::Chat::ToolChoiceAuto, DedalusSDK::Models::Chat::ToolChoiceAny, DedalusSDK::Models::Chat::ToolChoiceTool, DedalusSDK::Models::Chat::ToolChoiceNone, nil] Controls which (if any) tool is called by the model. `none` means the model will
        #
        #   @param tool_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Tool calling configuration (Google-specific)
        #
        #   @param tools [Array<DedalusSDK::Models::Chat::ChatCompletionToolParam>, nil] Available tools/functions for the model
        #
        #   @param top_k [Integer, nil] Top-k sampling parameter
        #
        #   @param top_logprobs [Integer, nil] An integer between 0 and 20 specifying the number of most likely tokens to retur
        #
        #   @param top_p [Float, nil] Nucleus sampling threshold
        #
        #   @param user [String, nil] This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        #
        #   @param verbosity [String, nil] Constrains the verbosity of the model's response. Lower values will result in mo
        #
        #   @param web_search_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] This tool searches the web for relevant results to use in a response. Learn more

        # Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
        # objects with per-model settings.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#model
        module Model
          extend DedalusSDK::Internal::Type::Union

          # Model identifier string (e.g., 'openai/gpt-5', 'anthropic/claude-3-5-sonnet').
          variant String

          # Structured model selection entry used in request payloads.
          #
          # Supports OpenAI-style semantics (string model id) while enabling
          # optional per-model default settings for Dedalus multi-model routing.
          variant -> { DedalusSDK::DedalusModel }

          variant -> { DedalusSDK::Models::Chat::ChatCompletionCreateParams::Model::DedalusModelChoiceArray }

          # @!method self.variants
          #   @return [Array(String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          DedalusModelChoiceArray =
            DedalusSDK::Internal::Type::ArrayOf[union: -> { DedalusSDK::DedalusModelChoice }]
        end

        # Credentials for MCP server authentication. Each credential is matched to servers
        # by connection name.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#credentials
        module Credentials
          extend DedalusSDK::Internal::Type::Union

          # Credential for MCP server authentication.
          #
          # Passed at endpoint level (e.g., chat.completions.create) and matched
          # to MCP servers by connection name. Wire format matches dedalus_mcp.Credential.to_dict().
          variant -> { DedalusSDK::Credential }

          # List of credentials for MCP server authentication.
          variant -> { DedalusSDK::MCPCredentials }

          # @!method self.variants
          #   @return [Array(DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>)]
        end

        # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
        # objects. MCP tools are executed server-side and billed separately.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#mcp_servers
        module MCPServers
          extend DedalusSDK::Internal::Type::Union

          variant String

          # Structured MCP server specification.
          #
          # Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration", "version": "v1.0.0"}
          # URL-based:  {"url": "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
          variant -> { DedalusSDK::MCPServerSpec }

          # List of MCP server inputs (slugs or structured specs).
          variant -> { DedalusSDK::MCPServers }

          # @!method self.variants
          #   @return [Array(String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>)]
        end

        # Developer-provided instructions that the model should follow, regardless of
        # messages sent by the user. With o1 models and newer, `developer` messages
        # replace the previous `system` messages.
        #
        # Fields:
        #
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #   ArrayTitle("ChatCompletionRequestDeveloperMessageContentArray")]
        # - role (required): Literal["developer"]
        # - name (optional): str
        module Message
          extend DedalusSDK::Internal::Type::Union

          discriminator :role

          # Developer-provided instructions that the model should follow, regardless of
          # messages sent by the user. With o1 models and newer, `developer` messages
          # replace the previous `system` messages.
          #
          # Fields:
          # - content (required): str | Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1), ArrayTitle("ChatCompletionRequestDeveloperMessageContentArray")]
          # - role (required): Literal["developer"]
          # - name (optional): str
          variant :developer, -> { DedalusSDK::Chat::ChatCompletionDeveloperMessageParam }

          # Developer-provided instructions that the model should follow, regardless of
          # messages sent by the user. With o1 models and newer, use `developer` messages
          # for this purpose instead.
          #
          # Fields:
          # - content (required): str | Annotated[list[ChatCompletionRequestSystemMessageContentPart], MinLen(1), ArrayTitle("ChatCompletionRequestSystemMessageContentArray")]
          # - role (required): Literal["system"]
          # - name (optional): str
          variant :system, -> { DedalusSDK::Chat::ChatCompletionSystemMessageParam }

          # Messages sent by an end user, containing prompts or additional context
          # information.
          #
          # Fields:
          # - content (required): str | Annotated[list[ChatCompletionRequestUserMessageContentPart], MinLen(1), ArrayTitle("ChatCompletionRequestUserMessageContentArray")]
          # - role (required): Literal["user"]
          # - name (optional): str
          variant :user, -> { DedalusSDK::Chat::ChatCompletionUserMessageParam }

          # Messages sent by the model in response to user messages.
          #
          # Fields:
          # - content (optional): str | Annotated[list[ChatCompletionRequestAssistantMessageContentPart], MinLen(1), ArrayTitle("ChatCompletionRequestAssistantMessageContentArray")] | None
          # - refusal (optional): str | None
          # - role (required): Literal["assistant"]
          # - name (optional): str
          # - audio (optional): Audio | None
          # - tool_calls (optional): ChatCompletionMessageToolCalls
          # - function_call (optional): FunctionCall | None
          variant :assistant, -> { DedalusSDK::Chat::ChatCompletionAssistantMessageParam }

          # Schema for ChatCompletionRequestToolMessage.
          #
          # Fields:
          # - role (required): Literal["tool"]
          # - content (required): str | Annotated[list[ChatCompletionRequestToolMessageContentPart], MinLen(1), ArrayTitle("ChatCompletionRequestToolMessageContentArray")]
          # - tool_call_id (required): str
          variant :tool, -> { DedalusSDK::Chat::ChatCompletionToolMessageParam }

          # Schema for ChatCompletionRequestFunctionMessage.
          #
          # Fields:
          # - role (required): Literal["function"]
          # - content (required): str | None
          # - name (required): str
          variant :function, -> { DedalusSDK::Chat::ChatCompletionFunctionMessageParam }

          # @!method self.variants
          #   @return [Array(DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam, DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam, DedalusSDK::Models::Chat::ChatCompletionUserMessageParam, DedalusSDK::Models::Chat::ChatCompletionAssistantMessageParam, DedalusSDK::Models::Chat::ChatCompletionToolMessageParam, DedalusSDK::Models::Chat::ChatCompletionFunctionMessageParam)]
        end

        # Allows toggling between the reasoning mode and no system prompt. When set to
        # `reasoning` the system prompt for reasoning models will be used.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#prompt_mode
        module PromptMode
          extend DedalusSDK::Internal::Type::Enum

          REASONING = :reasoning

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # An object specifying the format that the model must output. Setting to
        # `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
        # which ensures the model will match your supplied JSON schema. Learn more in the
        # [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
        # `{ "type": "json_object" }` enables the older JSON mode, which ensures the
        # message the model generates is valid JSON. Using `json_schema` is preferred for
        # models that support it.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#response_format
        module ResponseFormat
          extend DedalusSDK::Internal::Type::Union

          discriminator :type

          # Default response format. Used to generate text responses.
          #
          # Fields:
          # - type (required): Literal["text"]
          variant :text, -> { DedalusSDK::ResponseFormatText }

          # JSON Schema response format. Used to generate structured JSON responses.
          # Learn more about [Structured Outputs](/docs/guides/structured-outputs).
          #
          # Fields:
          # - type (required): Literal["json_schema"]
          # - json_schema (required): JSONSchema
          variant :json_schema, -> { DedalusSDK::ResponseFormatJSONSchema }

          # JSON object response format. An older method of generating JSON responses.
          # Using `json_schema` is recommended for models that support it. Note that the
          # model will not generate JSON without a system or user message instructing it
          # to do so.
          #
          # Fields:
          # - type (required): Literal["json_object"]
          variant :json_object, -> { DedalusSDK::ResponseFormatJSONObject }

          # @!method self.variants
          #   @return [Array(DedalusSDK::Models::ResponseFormatText, DedalusSDK::Models::ResponseFormatJSONSchema, DedalusSDK::Models::ResponseFormatJSONObject)]
        end

        class SafetySetting < DedalusSDK::Internal::Type::BaseModel
          # @!attribute category
          #   Required. The category for this setting.
          #
          #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting::Category]
          required :category, enum: -> { DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category }

          # @!attribute threshold
          #   Required. Controls the probability threshold at which harm is blocked.
          #
          #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting::Threshold]
          required :threshold, enum: -> { DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold }

          # @!method initialize(category:, threshold:)
          #   Safety setting, affecting the safety-blocking behavior.
          #
          #   Passing a safety setting for a category changes the allowed probability that
          #   content is blocked.
          #
          #   Fields:
          #
          #   - threshold (required): Literal["HARM_BLOCK_THRESHOLD_UNSPECIFIED",
          #     "BLOCK_LOW_AND_ABOVE", "BLOCK_MEDIUM_AND_ABOVE", "BLOCK_ONLY_HIGH",
          #     "BLOCK_NONE", "OFF"]
          #   - category (required): HarmCategory
          #
          #   @param category [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting::Category] Required. The category for this setting.
          #
          #   @param threshold [Symbol, DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting::Threshold] Required. Controls the probability threshold at which harm is blocked.

          # Required. The category for this setting.
          #
          # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting#category
          module Category
            extend DedalusSDK::Internal::Type::Enum

            HARM_CATEGORY_UNSPECIFIED = :HARM_CATEGORY_UNSPECIFIED
            HARM_CATEGORY_DEROGATORY = :HARM_CATEGORY_DEROGATORY
            HARM_CATEGORY_TOXICITY = :HARM_CATEGORY_TOXICITY
            HARM_CATEGORY_VIOLENCE = :HARM_CATEGORY_VIOLENCE
            HARM_CATEGORY_SEXUAL = :HARM_CATEGORY_SEXUAL
            HARM_CATEGORY_MEDICAL = :HARM_CATEGORY_MEDICAL
            HARM_CATEGORY_DANGEROUS = :HARM_CATEGORY_DANGEROUS
            HARM_CATEGORY_HARASSMENT = :HARM_CATEGORY_HARASSMENT
            HARM_CATEGORY_HATE_SPEECH = :HARM_CATEGORY_HATE_SPEECH
            HARM_CATEGORY_SEXUALLY_EXPLICIT = :HARM_CATEGORY_SEXUALLY_EXPLICIT
            HARM_CATEGORY_DANGEROUS_CONTENT = :HARM_CATEGORY_DANGEROUS_CONTENT
            HARM_CATEGORY_CIVIC_INTEGRITY = :HARM_CATEGORY_CIVIC_INTEGRITY

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Required. Controls the probability threshold at which harm is blocked.
          #
          # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams::SafetySetting#threshold
          module Threshold
            extend DedalusSDK::Internal::Type::Enum

            HARM_BLOCK_THRESHOLD_UNSPECIFIED = :HARM_BLOCK_THRESHOLD_UNSPECIFIED
            BLOCK_LOW_AND_ABOVE = :BLOCK_LOW_AND_ABOVE
            BLOCK_MEDIUM_AND_ABOVE = :BLOCK_MEDIUM_AND_ABOVE
            BLOCK_ONLY_HIGH = :BLOCK_ONLY_HIGH
            BLOCK_NONE = :BLOCK_NONE
            OFF = :OFF

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The inference speed mode for this request. `"fast"` enables high
        # output-tokens-per-second inference.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#speed
        module Speed
          extend DedalusSDK::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Sequences that stop generation
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#stop
        module Stop
          extend DedalusSDK::Internal::Type::Union

          variant -> { DedalusSDK::Models::Chat::ChatCompletionCreateParams::Stop::StringArray }

          variant String

          # @!method self.variants
          #   @return [Array(Array<String>, String)]

          # @type [DedalusSDK::Internal::Type::Converter]
          StringArray = DedalusSDK::Internal::Type::ArrayOf[String]
        end

        # System instruction/prompt
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#system_instruction
        module SystemInstruction
          extend DedalusSDK::Internal::Type::Union

          variant -> { DedalusSDK::JSONObjectInput }

          variant String

          # @!method self.variants
          #   @return [Array(Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, String)]
        end

        # Extended thinking configuration (Anthropic-specific)
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#thinking
        module Thinking
          extend DedalusSDK::Internal::Type::Union

          discriminator :type

          # Schema for ThinkingConfigEnabled.
          #
          # Fields:
          # - budget_tokens (required): int
          # - type (required): Literal["enabled"]
          variant :enabled, -> { DedalusSDK::Chat::ThinkingConfigEnabled }

          # Schema for ThinkingConfigDisabled.
          #
          # Fields:
          # - type (required): Literal["disabled"]
          variant :disabled, -> { DedalusSDK::Chat::ThinkingConfigDisabled }

          # Schema for ThinkingConfigAdaptive.
          #
          # Fields:
          # - type (required): Literal["adaptive"]
          variant :adaptive, -> { DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive }

          class Adaptive < DedalusSDK::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :adaptive]
            required :type, const: :adaptive

            # @!method initialize(type: :adaptive)
            #   Schema for ThinkingConfigAdaptive.
            #
            #   Fields:
            #
            #   - type (required): Literal["adaptive"]
            #
            #   @param type [Symbol, :adaptive]
          end

          # @!method self.variants
          #   @return [Array(DedalusSDK::Models::Chat::ThinkingConfigEnabled, DedalusSDK::Models::Chat::ThinkingConfigDisabled, DedalusSDK::Models::Chat::ChatCompletionCreateParams::Thinking::Adaptive)]
        end

        # Controls which (if any) tool is called by the model. `none` means the model will
        # not call any tool and instead generates a message. `auto` means the model can
        # pick between generating a message or calling one or more tools. `required` means
        # the model must call one or more tools. Specifying a particular tool via
        # `{"type": "function", "function": {"name": "my_function"}}` forces the model to
        # call that tool. `none` is the default when no tools are present. `auto` is the
        # default if tools are present.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionCreateParams#tool_choice
        module ToolChoice
          extend DedalusSDK::Internal::Type::Union

          variant String

          # The model will automatically decide whether to use tools.
          #
          # Fields:
          # - disable_parallel_tool_use (optional): bool
          # - type (required): Literal["auto"]
          variant -> { DedalusSDK::Chat::ToolChoiceAuto }

          # The model will use any available tools.
          #
          # Fields:
          # - disable_parallel_tool_use (optional): bool
          # - type (required): Literal["any"]
          variant -> { DedalusSDK::Chat::ToolChoiceAny }

          # The model will use the specified tool with `tool_choice.name`.
          #
          # Fields:
          # - disable_parallel_tool_use (optional): bool
          # - name (required): str
          # - type (required): Literal["tool"]
          variant -> { DedalusSDK::Chat::ToolChoiceTool }

          # The model will not be allowed to use tools.
          #
          # Fields:
          # - type (required): Literal["none"]
          variant -> { DedalusSDK::Chat::ToolChoiceNone }

          # @!method self.variants
          #   @return [Array(String, DedalusSDK::Models::Chat::ToolChoiceAuto, DedalusSDK::Models::Chat::ToolChoiceAny, DedalusSDK::Models::Chat::ToolChoiceTool, DedalusSDK::Models::Chat::ToolChoiceNone)]
        end
      end
    end

    ChatCompletionCreateParams = Chat::ChatCompletionCreateParams
  end
end
