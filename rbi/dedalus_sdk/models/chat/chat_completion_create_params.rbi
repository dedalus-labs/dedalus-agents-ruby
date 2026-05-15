# typed: strong

module DedalusSDK
  module Models
    ChatCompletionCreateParams = Chat::ChatCompletionCreateParams

    module Chat
      class ChatCompletionCreateParams < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionCreateParams,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
        # objects with per-model settings.
        sig do
          returns(
            T.any(
              String,
              DedalusSDK::DedalusModel,
              T::Array[T.any(String, DedalusSDK::DedalusModel)]
            )
          )
        end
        attr_accessor :model

        # Agent attributes. Values in [0.0, 1.0].
        sig { returns(T.nilable(T::Hash[Symbol, Float])) }
        attr_accessor :agent_attributes

        # Parameters for audio output. Required when audio output is requested with
        # `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
        #
        # Fields:
        #
        # - voice (required): VoiceIdsOrCustomVoice
        # - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
        sig { returns(T.nilable(DedalusSDK::Chat::ChatCompletionAudioParam)) }
        attr_reader :audio

        sig do
          params(
            audio: T.nilable(DedalusSDK::Chat::ChatCompletionAudioParam::OrHash)
          ).void
        end
        attr_writer :audio

        # Execute tools server-side. If false, returns raw tool calls for manual handling.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :automatic_tool_execution

        sig { params(automatic_tool_execution: T::Boolean).void }
        attr_writer :automatic_tool_execution

        # Optional. The name of the content
        # [cached](https://ai.google.dev/gemini-api/docs/caching) to use as context to
        # serve the prediction. Format: `cachedContents/{cachedContent}`
        sig { returns(T.nilable(String)) }
        attr_accessor :cached_content

        # Stable session ID for resuming a previous handoff. Returned by the server on
        # handoff; echo it on the next request to resume.
        sig { returns(T.nilable(String)) }
        attr_accessor :correlation_id

        # Credentials for MCP server authentication. Each credential is matched to servers
        # by connection name.
        sig do
          returns(
            T.nilable(
              T.any(DedalusSDK::Credential, T::Array[DedalusSDK::Credential])
            )
          )
        end
        attr_accessor :credentials

        # If set to `true`, the request returns a `request_id`. You can then get the
        # deferred response by GET `/v1/chat/deferred-completion/{request_id}`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :deferred

        # Tier 2 stateless resumption. Deferred tool specs from a previous handoff
        # response, sent back verbatim so the server can resume without Redis.
        sig do
          returns(T.nilable(T::Array[DedalusSDK::Chat::DeferredCallResponse]))
        end
        attr_accessor :deferred_calls

        # Number between -2.0 and 2.0. Positive values penalize new tokens based on their
        # existing frequency in the text so far, decreasing the model's likelihood to
        # repeat the same line verbatim.
        sig { returns(T.nilable(Float)) }
        attr_accessor :frequency_penalty

        # Deprecated in favor of `tool_choice`. Controls which (if any) function is called
        # by the model. `none` means the model will not call a function and instead
        # generates a message. `auto` means the model can pick between generating a
        # message or calling a function. Specifying a particular function via
        # `{"name": "my_function"}` forces the model to call that function. `none` is the
        # default when no functions are present. `auto` is the default if functions are
        # present.
        sig { returns(T.nilable(String)) }
        attr_accessor :function_call

        # Deprecated in favor of `tools`. A list of functions the model may generate JSON
        # inputs for.
        sig do
          returns(
            T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionFunctions])
          )
        end
        attr_accessor :functions

        # Generation parameters wrapper (Google-specific)
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :generation_config

        # Content filtering and safety policy configuration.
        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_accessor :guardrails

        # Configuration for multi-model handoffs.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :handoff_config

        # Handoff control. None or omitted: auto-detect. true: structured handoff (SDK).
        # false: drop-in (LLM re-run for mixed turns).
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :handoff_mode

        # Specifies the geographic region for inference processing. If not specified, the
        # workspace's `default_inference_geo` is used.
        sig { returns(T.nilable(String)) }
        attr_accessor :inference_geo

        # Modify the likelihood of specified tokens appearing in the completion. Accepts a
        # JSON object that maps tokens (specified by their token ID in the tokenizer) to
        # an associated bias value from -100 to 100. Mathematically, the bias is added to
        # the logits generated by the model prior to sampling. The exact effect will vary
        # per model, but values between -1 and 1 should decrease or increase likelihood of
        # selection; values like -100 or 100 should result in a ban or exclusive selection
        # of the relevant token.
        sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
        attr_accessor :logit_bias

        # Whether to return log probabilities of the output tokens or not. If true,
        # returns the log probabilities of each output token returned in the `content` of
        # `message`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :logprobs

        # Maximum tokens in completion (newer parameter name)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_completion_tokens

        # Maximum tokens in completion
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        # Maximum conversation turns.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_turns

        # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
        # objects. MCP tools are executed server-side and billed separately.
        sig do
          returns(
            T.nilable(
              T.any(
                String,
                DedalusSDK::MCPServerSpec,
                T::Array[T.any(String, DedalusSDK::MCPServerSpec)]
              )
            )
          )
        end
        attr_accessor :mcp_servers

        # Conversation history (OpenAI: messages, Google: contents, Responses: input)
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  DedalusSDK::Chat::ChatCompletionDeveloperMessageParam,
                  DedalusSDK::Chat::ChatCompletionSystemMessageParam,
                  DedalusSDK::Chat::ChatCompletionUserMessageParam,
                  DedalusSDK::Chat::ChatCompletionAssistantMessageParam,
                  DedalusSDK::Chat::ChatCompletionToolMessageParam,
                  DedalusSDK::Chat::ChatCompletionFunctionMessageParam
                )
              ]
            )
          )
        end
        attr_accessor :messages

        # Set of 16 key-value pairs that can be attached to an object. This can be useful
        # for storing additional information about the object in a structured format, and
        # querying for objects via API or the dashboard. Keys are strings with a maximum
        # length of 64 characters. Values are strings with a maximum length of 512
        # characters.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :metadata

        # Output types that you would like the model to generate. Most models are capable
        # of generating text, which is the default: `["text"]` The `gpt-4o-audio-preview`
        # model can also be used to [generate audio](/docs/guides/audio). To request that
        # this model generate both text and audio responses, you can use:
        # `["text", "audio"]`
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :modalities

        # Model attributes for routing. Maps model IDs to attribute dictionaries with
        # values in [0.0, 1.0].
        sig { returns(T.nilable(T::Hash[Symbol, T::Hash[Symbol, Float]])) }
        attr_accessor :model_attributes

        # How many chat completion choices to generate for each input message. Note that
        # you will be charged based on the number of generated tokens across all of the
        # choices. Keep `n` as `1` to minimize costs.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :n

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :output_config

        # Whether to enable parallel tool calls (Anthropic uses inverted polarity).
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :parallel_tool_calls

        # Static predicted output content, such as the content of a text file that is
        # being regenerated.
        #
        # Fields:
        #
        # - type (required): Literal["content"]
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #   ArrayTitle("PredictionContentArray")]
        sig { returns(T.nilable(DedalusSDK::Chat::PredictionContent)) }
        attr_reader :prediction

        sig do
          params(
            prediction: T.nilable(DedalusSDK::Chat::PredictionContent::OrHash)
          ).void
        end
        attr_writer :prediction

        # Number between -2.0 and 2.0. Positive values penalize new tokens based on
        # whether they appear in the text so far, increasing the model's likelihood to
        # talk about new topics.
        sig { returns(T.nilable(Float)) }
        attr_accessor :presence_penalty

        # Used by OpenAI to cache responses for similar requests to optimize your cache
        # hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).
        sig { returns(T.nilable(String)) }
        attr_accessor :prompt_cache_key

        # The retention policy for the prompt cache. Set to `24h` to enable extended
        # prompt caching, which keeps cached prefixes active for longer, up to a maximum
        # of 24 hours. [Learn more](/docs/guides/prompt-caching#prompt-cache-retention).
        sig { returns(T.nilable(String)) }
        attr_accessor :prompt_cache_retention

        # Allows toggling between the reasoning mode and no system prompt. When set to
        # `reasoning` the system prompt for reasoning models will be used.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode::OrSymbol
            )
          )
        end
        attr_accessor :prompt_mode

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
        sig { returns(T.nilable(String)) }
        attr_accessor :reasoning_effort

        # An object specifying the format that the model must output. Setting to
        # `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
        # which ensures the model will match your supplied JSON schema. Learn more in the
        # [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
        # `{ "type": "json_object" }` enables the older JSON mode, which ensures the
        # message the model generates is valid JSON. Using `json_schema` is preferred for
        # models that support it.
        sig do
          returns(
            T.nilable(
              T.any(
                DedalusSDK::ResponseFormatText,
                DedalusSDK::ResponseFormatJSONSchema,
                DedalusSDK::ResponseFormatJSONObject
              )
            )
          )
        end
        attr_accessor :response_format

        # Whether to inject a safety prompt before all conversations.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :safe_prompt

        # A stable identifier used to help detect users of your application that may be
        # violating OpenAI's usage policies. The IDs should be a string that uniquely
        # identifies each user. We recommend hashing their username or email address, in
        # order to avoid sending us any identifying information.
        # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
        sig { returns(T.nilable(String)) }
        attr_accessor :safety_identifier

        # Safety/content filtering settings (Google-specific)
        sig do
          returns(
            T.nilable(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting
              ]
            )
          )
        end
        attr_accessor :safety_settings

        # Set the parameters to be used for searched data. If not set, no data will be
        # acquired by the model.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :search_parameters

        # Random seed for deterministic output
        sig { returns(T.nilable(Integer)) }
        attr_accessor :seed

        # Service tier for request processing
        sig { returns(T.nilable(String)) }
        attr_accessor :service_tier

        # The inference speed mode for this request. `"fast"` enables high
        # output-tokens-per-second inference.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletionCreateParams::Speed::OrSymbol
            )
          )
        end
        attr_accessor :speed

        # Sequences that stop generation
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletionCreateParams::Stop::Variants
            )
          )
        end
        attr_accessor :stop

        # Whether or not to store the output of this chat completion request for use in
        # our [model distillation](/docs/guides/distillation) or
        # [evals](/docs/guides/evals) products. Supports text and image inputs. Note:
        # image inputs over 8MB will be dropped.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :store

        # Enable streaming response
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :stream

        # Options for streaming response. Only set this when you set `stream: true`.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :stream_options

        # System instruction/prompt
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction::Variants
            )
          )
        end
        attr_accessor :system_instruction

        # Sampling temperature (0-2 for most providers)
        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        # Extended thinking configuration (Anthropic-specific)
        sig do
          returns(
            T.nilable(
              T.any(
                DedalusSDK::Chat::ThinkingConfigEnabled,
                DedalusSDK::Chat::ThinkingConfigDisabled,
                DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive
              )
            )
          )
        end
        attr_accessor :thinking

        # Controls which (if any) tool is called by the model. `none` means the model will
        # not call any tool and instead generates a message. `auto` means the model can
        # pick between generating a message or calling one or more tools. `required` means
        # the model must call one or more tools. Specifying a particular tool via
        # `{"type": "function", "function": {"name": "my_function"}}` forces the model to
        # call that tool. `none` is the default when no tools are present. `auto` is the
        # default if tools are present.
        sig do
          returns(
            T.nilable(
              T.any(
                String,
                DedalusSDK::Chat::ToolChoiceAuto,
                DedalusSDK::Chat::ToolChoiceAny,
                DedalusSDK::Chat::ToolChoiceTool,
                DedalusSDK::Chat::ToolChoiceNone
              )
            )
          )
        end
        attr_accessor :tool_choice

        # Tool calling configuration (Google-specific)
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :tool_config

        # Available tools/functions for the model
        sig do
          returns(
            T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionToolParam])
          )
        end
        attr_accessor :tools

        # Top-k sampling parameter
        sig { returns(T.nilable(Integer)) }
        attr_accessor :top_k

        # An integer between 0 and 20 specifying the number of most likely tokens to
        # return at each token position, each with an associated log probability.
        # `logprobs` must be set to `true` if this parameter is used.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :top_logprobs

        # Nucleus sampling threshold
        sig { returns(T.nilable(Float)) }
        attr_accessor :top_p

        # This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        # `prompt_cache_key` instead to maintain caching optimizations. A stable
        # identifier for your end-users. Used to boost cache hit rates by better bucketing
        # similar requests and to help OpenAI detect and prevent abuse.
        # [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
        sig { returns(T.nilable(String)) }
        attr_accessor :user

        # Constrains the verbosity of the model's response. Lower values will result in
        # more concise responses, while higher values will result in more verbose
        # responses. Currently supported values are `low`, `medium`, and `high`.
        sig { returns(T.nilable(String)) }
        attr_accessor :verbosity

        # This tool searches the web for relevant results to use in a response. Learn more
        # about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :web_search_options

        # ChatCompletion request schema.
        #
        # Supports OpenAI-compatible parameters, provider-specific extensions, server-side
        # execution, and agent orchestration features.
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
            stream: T.nilable(T::Boolean),
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
              )
          ).returns(T.attached_class)
        end
        def self.new(
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
          # Enable streaming response
          stream: nil,
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
          web_search_options: nil
        )
        end

        sig do
          override.returns(
            {
              model:
                T.any(
                  String,
                  DedalusSDK::DedalusModel,
                  T::Array[T.any(String, DedalusSDK::DedalusModel)]
                ),
              agent_attributes: T.nilable(T::Hash[Symbol, Float]),
              audio: T.nilable(DedalusSDK::Chat::ChatCompletionAudioParam),
              automatic_tool_execution: T::Boolean,
              cached_content: T.nilable(String),
              correlation_id: T.nilable(String),
              credentials:
                T.nilable(
                  T.any(
                    DedalusSDK::Credential,
                    T::Array[DedalusSDK::Credential]
                  )
                ),
              deferred: T.nilable(T::Boolean),
              deferred_calls:
                T.nilable(T::Array[DedalusSDK::Chat::DeferredCallResponse]),
              frequency_penalty: T.nilable(Float),
              function_call: T.nilable(String),
              functions:
                T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionFunctions]),
              generation_config:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
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
                    DedalusSDK::MCPServerSpec,
                    T::Array[T.any(String, DedalusSDK::MCPServerSpec)]
                  )
                ),
              messages:
                T.nilable(
                  T::Array[
                    T.any(
                      DedalusSDK::Chat::ChatCompletionDeveloperMessageParam,
                      DedalusSDK::Chat::ChatCompletionSystemMessageParam,
                      DedalusSDK::Chat::ChatCompletionUserMessageParam,
                      DedalusSDK::Chat::ChatCompletionAssistantMessageParam,
                      DedalusSDK::Chat::ChatCompletionToolMessageParam,
                      DedalusSDK::Chat::ChatCompletionFunctionMessageParam
                    )
                  ]
                ),
              metadata:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ),
              modalities: T.nilable(T::Array[String]),
              model_attributes:
                T.nilable(T::Hash[Symbol, T::Hash[Symbol, Float]]),
              n: T.nilable(Integer),
              output_config:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ),
              parallel_tool_calls: T.nilable(T::Boolean),
              prediction: T.nilable(DedalusSDK::Chat::PredictionContent),
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
                    DedalusSDK::ResponseFormatText,
                    DedalusSDK::ResponseFormatJSONSchema,
                    DedalusSDK::ResponseFormatJSONObject
                  )
                ),
              safe_prompt: T.nilable(T::Boolean),
              safety_identifier: T.nilable(String),
              safety_settings:
                T.nilable(
                  T::Array[
                    DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting
                  ]
                ),
              search_parameters:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
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
              stream: T.nilable(T::Boolean),
              stream_options:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ),
              system_instruction:
                T.nilable(
                  DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction::Variants
                ),
              temperature: T.nilable(Float),
              thinking:
                T.nilable(
                  T.any(
                    DedalusSDK::Chat::ThinkingConfigEnabled,
                    DedalusSDK::Chat::ThinkingConfigDisabled,
                    DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive
                  )
                ),
              tool_choice:
                T.nilable(
                  T.any(
                    String,
                    DedalusSDK::Chat::ToolChoiceAuto,
                    DedalusSDK::Chat::ToolChoiceAny,
                    DedalusSDK::Chat::ToolChoiceTool,
                    DedalusSDK::Chat::ToolChoiceNone
                  )
                ),
              tool_config:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ),
              tools:
                T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionToolParam]),
              top_k: T.nilable(Integer),
              top_logprobs: T.nilable(Integer),
              top_p: T.nilable(Float),
              user: T.nilable(String),
              verbosity: T.nilable(String),
              web_search_options:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                )
            }
          )
        end
        def to_hash
        end

        # Model identifier. Accepts model ID strings, lists for routing, or DedalusModel
        # objects with per-model settings.
        module Model
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::DedalusModel,
                T::Array[DedalusSDK::DedalusModelChoice::Variants]
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Model::Variants
              ]
            )
          end
          def self.variants
          end

          DedalusModelChoiceArray =
            T.let(
              DedalusSDK::Internal::Type::ArrayOf[
                union: DedalusSDK::DedalusModelChoice
              ],
              DedalusSDK::Internal::Type::Converter
            )
        end

        # Credentials for MCP server authentication. Each credential is matched to servers
        # by connection name.
        module Credentials
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(DedalusSDK::Credential, T::Array[DedalusSDK::Credential])
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Credentials::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
        # objects. MCP tools are executed server-side and billed separately.
        module MCPServers
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::MCPServerSpec,
                T::Array[DedalusSDK::MCPServerItem::Variants]
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::MCPServers::Variants
              ]
            )
          end
          def self.variants
          end
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

          Variants =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionDeveloperMessageParam,
                DedalusSDK::Chat::ChatCompletionSystemMessageParam,
                DedalusSDK::Chat::ChatCompletionUserMessageParam,
                DedalusSDK::Chat::ChatCompletionAssistantMessageParam,
                DedalusSDK::Chat::ChatCompletionToolMessageParam,
                DedalusSDK::Chat::ChatCompletionFunctionMessageParam
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Message::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Allows toggling between the reasoning mode and no system prompt. When set to
        # `reasoning` the system prompt for reasoning models will be used.
        module PromptMode
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REASONING =
            T.let(
              :reasoning,
              DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::PromptMode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # An object specifying the format that the model must output. Setting to
        # `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
        # which ensures the model will match your supplied JSON schema. Learn more in the
        # [Structured Outputs guide](/docs/guides/structured-outputs). Setting to
        # `{ "type": "json_object" }` enables the older JSON mode, which ensures the
        # message the model generates is valid JSON. Using `json_schema` is preferred for
        # models that support it.
        module ResponseFormat
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                DedalusSDK::ResponseFormatText,
                DedalusSDK::ResponseFormatJSONSchema,
                DedalusSDK::ResponseFormatJSONObject
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::ResponseFormat::Variants
              ]
            )
          end
          def self.variants
          end
        end

        class SafetySetting < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting,
                DedalusSDK::Internal::AnyHash
              )
            end

          # Required. The category for this setting.
          sig do
            returns(
              DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::OrSymbol
            )
          end
          attr_accessor :category

          # Required. Controls the probability threshold at which harm is blocked.
          sig do
            returns(
              DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::OrSymbol
            )
          end
          attr_accessor :threshold

          # Safety setting, affecting the safety-blocking behavior.
          #
          # Passing a safety setting for a category changes the allowed probability that
          # content is blocked.
          #
          # Fields:
          #
          # - threshold (required): Literal["HARM_BLOCK_THRESHOLD_UNSPECIFIED",
          #   "BLOCK_LOW_AND_ABOVE", "BLOCK_MEDIUM_AND_ABOVE", "BLOCK_ONLY_HIGH",
          #   "BLOCK_NONE", "OFF"]
          # - category (required): HarmCategory
          sig do
            params(
              category:
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::OrSymbol,
              threshold:
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Required. The category for this setting.
            category:,
            # Required. Controls the probability threshold at which harm is blocked.
            threshold:
          )
          end

          sig do
            override.returns(
              {
                category:
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::OrSymbol,
                threshold:
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Required. The category for this setting.
          module Category
            extend DedalusSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HARM_CATEGORY_UNSPECIFIED =
              T.let(
                :HARM_CATEGORY_UNSPECIFIED,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_DEROGATORY =
              T.let(
                :HARM_CATEGORY_DEROGATORY,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_TOXICITY =
              T.let(
                :HARM_CATEGORY_TOXICITY,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_VIOLENCE =
              T.let(
                :HARM_CATEGORY_VIOLENCE,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_SEXUAL =
              T.let(
                :HARM_CATEGORY_SEXUAL,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_MEDICAL =
              T.let(
                :HARM_CATEGORY_MEDICAL,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_DANGEROUS =
              T.let(
                :HARM_CATEGORY_DANGEROUS,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_HARASSMENT =
              T.let(
                :HARM_CATEGORY_HARASSMENT,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_HATE_SPEECH =
              T.let(
                :HARM_CATEGORY_HATE_SPEECH,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_SEXUALLY_EXPLICIT =
              T.let(
                :HARM_CATEGORY_SEXUALLY_EXPLICIT,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_DANGEROUS_CONTENT =
              T.let(
                :HARM_CATEGORY_DANGEROUS_CONTENT,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )
            HARM_CATEGORY_CIVIC_INTEGRITY =
              T.let(
                :HARM_CATEGORY_CIVIC_INTEGRITY,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Required. Controls the probability threshold at which harm is blocked.
          module Threshold
            extend DedalusSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HARM_BLOCK_THRESHOLD_UNSPECIFIED =
              T.let(
                :HARM_BLOCK_THRESHOLD_UNSPECIFIED,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )
            BLOCK_LOW_AND_ABOVE =
              T.let(
                :BLOCK_LOW_AND_ABOVE,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )
            BLOCK_MEDIUM_AND_ABOVE =
              T.let(
                :BLOCK_MEDIUM_AND_ABOVE,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )
            BLOCK_ONLY_HIGH =
              T.let(
                :BLOCK_ONLY_HIGH,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )
            BLOCK_NONE =
              T.let(
                :BLOCK_NONE,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )
            OFF =
              T.let(
                :OFF,
                DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionCreateParams::SafetySetting::Threshold::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The inference speed mode for this request. `"fast"` enables high
        # output-tokens-per-second inference.
        module Speed
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletionCreateParams::Speed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              DedalusSDK::Chat::ChatCompletionCreateParams::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              DedalusSDK::Chat::ChatCompletionCreateParams::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Speed::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Sequences that stop generation
        module Stop
          extend DedalusSDK::Internal::Type::Union

          Variants = T.type_alias { T.any(T::Array[String], String) }

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Stop::Variants
              ]
            )
          end
          def self.variants
          end

          StringArray =
            T.let(
              DedalusSDK::Internal::Type::ArrayOf[String],
              DedalusSDK::Internal::Type::Converter
            )
        end

        # System instruction/prompt
        module SystemInstruction
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                T::Hash[
                  Symbol,
                  T.nilable(DedalusSDK::JSONValueInput::Variants)
                ],
                String
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::SystemInstruction::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Extended thinking configuration (Anthropic-specific)
        module Thinking
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ThinkingConfigEnabled,
                DedalusSDK::Chat::ThinkingConfigDisabled,
                DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive
              )
            end

          class Adaptive < DedalusSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Adaptive,
                  DedalusSDK::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Schema for ThinkingConfigAdaptive.
            #
            # Fields:
            #
            # - type (required): Literal["adaptive"]
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :adaptive)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::Thinking::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Controls which (if any) tool is called by the model. `none` means the model will
        # not call any tool and instead generates a message. `auto` means the model can
        # pick between generating a message or calling one or more tools. `required` means
        # the model must call one or more tools. Specifying a particular tool via
        # `{"type": "function", "function": {"name": "my_function"}}` forces the model to
        # call that tool. `none` is the default when no tools are present. `auto` is the
        # default if tools are present.
        module ToolChoice
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::Chat::ToolChoiceAuto,
                DedalusSDK::Chat::ToolChoiceAny,
                DedalusSDK::Chat::ToolChoiceTool,
                DedalusSDK::Chat::ToolChoiceNone
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionCreateParams::ToolChoice::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
