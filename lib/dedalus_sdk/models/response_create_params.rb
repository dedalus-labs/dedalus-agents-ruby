# frozen_string_literal: true

module DedalusSDK
  module Models
    class ResponseCreateParams < DedalusSDK::Internal::Type::BaseModel
      # @!attribute background
      #   Whether to run the model response in the background.
      #   [Learn more](https://platform.openai.com/docs/guides/background).
      #
      #   @return [Boolean, nil]
      optional :background, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute conversation
      #   Conversation that this response belongs to. Items from this conversation are
      #   prepended to the input items, and output items from this response are
      #   automatically added after completion.
      #
      #   @return [String, DedalusSDK::Models::ResponseCreateParams::Conversation::ResponseConversationParam, nil]
      optional :conversation, union: -> { DedalusSDK::ResponseCreateParams::Conversation }, nil?: true

      # @!attribute credentials
      #   Credentials for MCP server authentication. Each credential is matched to servers
      #   by connection name.
      #
      #   @return [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil]
      optional :credentials, union: -> { DedalusSDK::ResponseCreateParams::Credentials }, nil?: true

      # @!attribute frequency_penalty
      #   Penalizes new tokens based on their frequency in the text so far.
      #
      #   @return [Float, nil]
      optional :frequency_penalty, Float, nil?: true

      # @!attribute include
      #   Specify additional output data to include in the model response. Currently
      #   supported values are:
      #
      #   - `web_search_call.action.sources`: Include the sources of the web search tool
      #     call.
      #   - `code_interpreter_call.outputs`: Includes the outputs of python code execution
      #     in code interpreter tool call items.
      #   - `computer_call_output.output.image_url`: Include image urls from the computer
      #     call output.
      #   - `file_search_call.results`: Include the search results of the file search tool
      #     call.
      #   - `message.input_image.image_url`: Include image urls from the input message.
      #   - `message.output_text.logprobs`: Include logprobs with assistant messages.
      #   - `reasoning.encrypted_content`: Includes an encrypted version of reasoning
      #     tokens in reasoning item outputs. This enables reasoning items to be used in
      #     multi-turn conversations when using the Responses API statelessly (like when
      #     the `store` parameter is set to `false`, or when an organization is enrolled
      #     in the zero data retention program).
      #
      #   @return [Array<String>, nil]
      optional :include, DedalusSDK::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute input
      #   Text, image, or file inputs to the model, used to generate a response.
      #
      #   Learn more:
      #
      #   - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
      #   - [Image inputs](https://platform.openai.com/docs/guides/images)
      #   - [File inputs](https://platform.openai.com/docs/guides/pdf-files)
      #   - [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
      #   - [Function calling](https://platform.openai.com/docs/guides/function-calling)
      #
      #   @return [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil]
      optional :input, union: -> { DedalusSDK::ResponseCreateParams::Input }, nil?: true

      # @!attribute instructions
      #   A system (or developer) message inserted into the model's context.
      #
      #   When using along with `previous_response_id`, the instructions from a previous
      #   response will not be carried over to the next response. This makes it simple to
      #   swap out system (or developer) messages in new responses.
      #
      #   @return [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil]
      optional :instructions, union: -> { DedalusSDK::ResponseCreateParams::Instructions }, nil?: true

      # @!attribute max_output_tokens
      #   An upper bound for the number of tokens that can be generated for a response,
      #   including visible output tokens and
      #   [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
      #
      #   @return [Integer, nil]
      optional :max_output_tokens, Integer, nil?: true

      # @!attribute max_tool_calls
      #   The maximum number of total calls to built-in tools that can be processed in a
      #   response. This maximum number applies across all built-in tool calls, not per
      #   individual tool. Any further attempts to call a tool by the model will be
      #   ignored.
      #
      #   @return [Integer, nil]
      optional :max_tool_calls, Integer, nil?: true

      # @!attribute mcp_servers
      #   MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
      #   objects. MCP tools are executed server-side and billed separately.
      #
      #   @return [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil]
      optional :mcp_servers, union: -> { DedalusSDK::ResponseCreateParams::MCPServers }, nil?: true

      # @!attribute metadata
      #   Set of up to 16 key-value string pairs that can be attached to the response for
      #   structured metadata and later querying via the API or dashboard.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, DedalusSDK::Internal::Type::HashOf[String], nil?: true

      # @!attribute model
      #   Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI offers a
      #   wide range of models with different capabilities, performance characteristics,
      #   and price points. Refer to the
      #   [model guide](https://platform.openai.com/docs/models) to browse and compare
      #   available models.
      #
      #   @return [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>, nil]
      optional :model, union: -> { DedalusSDK::ResponseCreateParams::Model }, nil?: true

      # @!attribute parallel_tool_calls
      #   Whether to allow the model to run tool calls in parallel.
      #
      #   @return [Boolean, nil]
      optional :parallel_tool_calls, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute presence_penalty
      #   Penalizes new tokens based on whether they appear in the text so far.
      #
      #   @return [Float, nil]
      optional :presence_penalty, Float, nil?: true

      # @!attribute previous_response_id
      #   Unique ID of the previous response to continue from when creating multi-turn
      #   conversations. Cannot be used together with `conversation`.
      #
      #   @return [String, nil]
      optional :previous_response_id, String, nil?: true

      # @!attribute prompt
      #   Stored prompt template reference (BYOK).
      #
      #   @return [DedalusSDK::Models::ResponseCreateParams::Prompt, nil]
      optional :prompt, -> { DedalusSDK::ResponseCreateParams::Prompt }, nil?: true

      # @!attribute prompt_cache_key
      #   Used by OpenAI to cache responses for similar requests to optimize your cache
      #   hit rates. Replaces the `user` field.
      #   [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
      #
      #   @return [String, nil]
      optional :prompt_cache_key, String, nil?: true

      # @!attribute reasoning
      #   **gpt-5 and o-series models only**
      #
      #   Configuration options for
      #   [reasoning models](https://platform.openai.com/docs/guides/reasoning).
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :reasoning,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute safety_identifier
      #   A stable identifier used to help detect users of your application that may be
      #   violating OpenAI's usage policies. The IDs should be a string that uniquely
      #   identifies each user. We recommend hashing their username or email address, in
      #   order to avoid sending us any identifying information.
      #   [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
      #
      #   @return [String, nil]
      optional :safety_identifier, String, nil?: true

      # @!attribute service_tier
      #   Specifies the processing type used for serving the request.
      #
      #   - If set to 'auto', then the request will be processed with the service tier
      #     configured in the Project settings. Unless otherwise configured, the Project
      #     will use 'default'.
      #   - If set to 'default', then the request will be processed with the standard
      #     pricing and performance for the selected model.
      #   - If set to '[flex](https://platform.openai.com/docs/guides/flex-processing)' or
      #     '[priority](https://openai.com/api-priority-processing/)', then the request
      #     will be processed with the corresponding service tier.
      #   - When not set, the default behavior is 'auto'.
      #
      #   When the `service_tier` parameter is set, the response body will include the
      #   `service_tier` value based on the processing mode actually used to serve the
      #   request. This response value may be different from the value set in the
      #   parameter.
      #
      #   @return [Symbol, DedalusSDK::Models::ResponseCreateParams::ServiceTier, nil]
      optional :service_tier, enum: -> { DedalusSDK::ResponseCreateParams::ServiceTier }, nil?: true

      # @!attribute store
      #   Whether to store the generated response for later retrieval via the Responses
      #   API.
      #
      #   @return [Boolean, nil]
      optional :store, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute stream
      #   If set to true, the model response data will be streamed to the client as it is
      #   generated using
      #   [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
      #   See the
      #   [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
      #   for more information.
      #
      #   @return [Boolean, nil]
      optional :stream, DedalusSDK::Internal::Type::Boolean

      # @!attribute stream_options
      #   Options for streaming response. Only set this when you set `stream: true`.
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :stream_options,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute temperature
      #   What sampling temperature to use, between 0 and 2. Higher values like 0.8 will
      #   make the output more random, while lower values like 0.2 will make it more
      #   focused and deterministic. We generally recommend altering this or `top_p` but
      #   not both.
      #
      #   @return [Float, nil]
      optional :temperature, Float, nil?: true

      # @!attribute text
      #   Configuration options for a text response from the model. Can be plain text or
      #   structured JSON data. Learn more:
      #
      #   - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
      #   - [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :text,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute tool_choice
      #   How the model should select which tool (or tools) to use when generating a
      #   response. See the `tools` parameter to see how to specify which tools the model
      #   can call.
      #
      #   @return [String, Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :tool_choice, union: -> { DedalusSDK::ResponseCreateParams::ToolChoice }, nil?: true

      # @!attribute tools
      #   An array of tools the model may call while generating a response. You can
      #   specify which tool to use by setting the `tool_choice` parameter.
      #
      #   We support the following categories of tools:
      #
      #   - **Built-in tools**: Tools that are provided by OpenAI that extend the model's
      #     capabilities, like
      #     [web search](https://platform.openai.com/docs/guides/tools-web-search) or
      #     [file search](https://platform.openai.com/docs/guides/tools-file-search).
      #     Learn more about
      #     [built-in tools](https://platform.openai.com/docs/guides/tools).
      #   - **MCP Tools**: Integrations with third-party systems via custom MCP servers or
      #     predefined connectors such as Google Drive and SharePoint. Learn more about
      #     [MCP Tools](https://platform.openai.com/docs/guides/tools-connectors-mcp).
      #   - **Function calls (custom tools)**: Functions that are defined by you, enabling
      #     the model to call your own code with strongly typed arguments and outputs.
      #     Learn more about
      #     [function calling](https://platform.openai.com/docs/guides/function-calling).
      #     You can also use custom tools to call your own code.
      #
      #   @return [Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil]
      optional :tools,
               -> {
                 DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                                                        nil?: true]]
               },
               nil?: true

      # @!attribute top_logprobs
      #   An integer between 0 and 20 specifying the number of most likely tokens to
      #   return at each token position, each with an associated log probability.
      #
      #   @return [Integer, nil]
      optional :top_logprobs, Integer, nil?: true

      # @!attribute top_p
      #   An alternative to sampling with temperature, called nucleus sampling, where the
      #   model considers the results of the tokens with top_p probability mass. So 0.1
      #   means only the tokens comprising the top 10% probability mass are considered.
      #
      #   We generally recommend altering this or `temperature` but not both.
      #
      #   @return [Float, nil]
      optional :top_p, Float, nil?: true

      # @!attribute truncation
      #   The truncation strategy to use for the model response.
      #
      #   - `auto`: If the input to this Response exceeds the model's context window size,
      #     the model will truncate the response to fit the context window by dropping
      #     items from the beginning of the conversation.
      #   - `disabled` (default): If the input size will exceed the context window size
      #     for a model, the request will fail with a 400 error.
      #
      #   @return [Symbol, DedalusSDK::Models::ResponseCreateParams::Truncation, nil]
      optional :truncation, enum: -> { DedalusSDK::ResponseCreateParams::Truncation }, nil?: true

      # @!attribute user
      #   This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
      #   `prompt_cache_key` instead to maintain caching optimizations. A stable
      #   identifier for your end-users. Used to boost cache hit rates by better bucketing
      #   similar requests and to help OpenAI detect and prevent abuse.
      #   [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
      #
      #   @return [String, nil]
      optional :user, String, nil?: true

      # @!method initialize(background: nil, conversation: nil, credentials: nil, frequency_penalty: nil, include: nil, input: nil, instructions: nil, max_output_tokens: nil, max_tool_calls: nil, mcp_servers: nil, metadata: nil, model: nil, parallel_tool_calls: nil, presence_penalty: nil, previous_response_id: nil, prompt: nil, prompt_cache_key: nil, reasoning: nil, safety_identifier: nil, service_tier: nil, store: nil, stream: nil, stream_options: nil, temperature: nil, text: nil, tool_choice: nil, tools: nil, top_logprobs: nil, top_p: nil, truncation: nil, user: nil)
      #   Some parameter documentations has been truncated, see
      #   {DedalusSDK::Models::ResponseCreateParams} for more details.
      #
      #   Responses request schema with Dedalus extensions.
      #
      #   @param background [Boolean, nil] Whether to run the model response in the background.
      #
      #   @param conversation [String, DedalusSDK::Models::ResponseCreateParams::Conversation::ResponseConversationParam, nil] Conversation that this response belongs to. Items from this conversation are pre
      #
      #   @param credentials [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil] Credentials for MCP server authentication. Each credential is matched to servers
      #
      #   @param frequency_penalty [Float, nil] Penalizes new tokens based on their frequency in the text so far.
      #
      #   @param include [Array<String>, nil] Specify additional output data to include in the model response. Currently
      #
      #   @param input [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] Text, image, or file inputs to the model, used to generate a response.
      #
      #   @param instructions [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] A system (or developer) message inserted into the model's context.
      #
      #   @param max_output_tokens [Integer, nil] An upper bound for the number of tokens that can be generated for a response, in
      #
      #   @param max_tool_calls [Integer, nil] The maximum number of total calls to built-in tools that can be processed in a r
      #
      #   @param mcp_servers [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil] MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec object
      #
      #   @param metadata [Hash{Symbol=>String}, nil] Set of up to 16 key-value string pairs that can be attached to the response for
      #
      #   @param model [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>, nil] Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
      #
      #   @param parallel_tool_calls [Boolean, nil] Whether to allow the model to run tool calls in parallel.
      #
      #   @param presence_penalty [Float, nil] Penalizes new tokens based on whether they appear in the text so far.
      #
      #   @param previous_response_id [String, nil] Unique ID of the previous response to continue from when creating multi-turn con
      #
      #   @param prompt [DedalusSDK::Models::ResponseCreateParams::Prompt, nil] Stored prompt template reference (BYOK).
      #
      #   @param prompt_cache_key [String, nil] Used by OpenAI to cache responses for similar requests to optimize your cache hi
      #
      #   @param reasoning [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] **gpt-5 and o-series models only**
      #
      #   @param safety_identifier [String, nil] A stable identifier used to help detect users of your application that may be vi
      #
      #   @param service_tier [Symbol, DedalusSDK::Models::ResponseCreateParams::ServiceTier, nil] Specifies the processing type used for serving the request.
      #
      #   @param store [Boolean, nil] Whether to store the generated response for later retrieval via the Responses AP
      #
      #   @param stream [Boolean] If set to true, the model response data will be streamed to the client
      #
      #   @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Options for streaming response. Only set this when you set `stream: true`.
      #
      #   @param temperature [Float, nil] What sampling temperature to use, between 0 and 2. Higher values like 0.8 will m
      #
      #   @param text [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Configuration options for a text response from the model. Can be plain
      #
      #   @param tool_choice [String, Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] How the model should select which tool (or tools) to use when generating
      #
      #   @param tools [Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] An array of tools the model may call while generating a response. You
      #
      #   @param top_logprobs [Integer, nil] An integer between 0 and 20 specifying the number of most likely tokens to
      #
      #   @param top_p [Float, nil] An alternative to sampling with temperature, called nucleus sampling,
      #
      #   @param truncation [Symbol, DedalusSDK::Models::ResponseCreateParams::Truncation, nil] The truncation strategy to use for the model response.
      #
      #   @param user [String, nil] This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use

      # Conversation that this response belongs to. Items from this conversation are
      # prepended to the input items, and output items from this response are
      # automatically added after completion.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#conversation
      module Conversation
        extend DedalusSDK::Internal::Type::Union

        variant String

        # Conversation reference for continuing a Responses session.
        variant -> { DedalusSDK::ResponseCreateParams::Conversation::ResponseConversationParam }

        class ResponseConversationParam < DedalusSDK::Internal::Type::BaseModel
          # @!attribute id
          #   Identifier of the existing conversation.
          #
          #   @return [String]
          required :id, String

          # @!method initialize(id:)
          #   Conversation reference for continuing a Responses session.
          #
          #   @param id [String] Identifier of the existing conversation.
        end

        # @!method self.variants
        #   @return [Array(String, DedalusSDK::Models::ResponseCreateParams::Conversation::ResponseConversationParam)]
      end

      # Credentials for MCP server authentication. Each credential is matched to servers
      # by connection name.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#credentials
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

      # Text, image, or file inputs to the model, used to generate a response.
      #
      # Learn more:
      #
      # - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
      # - [Image inputs](https://platform.openai.com/docs/guides/images)
      # - [File inputs](https://platform.openai.com/docs/guides/pdf-files)
      # - [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
      # - [Function calling](https://platform.openai.com/docs/guides/function-calling)
      #
      # @see DedalusSDK::Models::ResponseCreateParams#input
      module Input
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant -> { DedalusSDK::Models::ResponseCreateParams::Input::JSONObjectInputArray }

        # @!method self.variants
        #   @return [Array(String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>)]

        # @type [DedalusSDK::Internal::Type::Converter]
        JSONObjectInputArray =
          DedalusSDK::Internal::Type::ArrayOf[-> {
            DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]
          }]
      end

      # A system (or developer) message inserted into the model's context.
      #
      # When using along with `previous_response_id`, the instructions from a previous
      # response will not be carried over to the next response. This makes it simple to
      # swap out system (or developer) messages in new responses.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#instructions
      module Instructions
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant -> { DedalusSDK::Models::ResponseCreateParams::Instructions::JSONObjectInputArray }

        # @!method self.variants
        #   @return [Array(String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>)]

        # @type [DedalusSDK::Internal::Type::Converter]
        JSONObjectInputArray =
          DedalusSDK::Internal::Type::ArrayOf[-> {
            DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]
          }]
      end

      # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
      # objects. MCP tools are executed server-side and billed separately.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#mcp_servers
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

      # Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI offers a
      # wide range of models with different capabilities, performance characteristics,
      # and price points. Refer to the
      # [model guide](https://platform.openai.com/docs/models) to browse and compare
      # available models.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#model
      module Model
        extend DedalusSDK::Internal::Type::Union

        # Model identifier string (e.g., 'openai/gpt-5', 'anthropic/claude-3-5-sonnet').
        variant String

        # Structured model selection entry used in request payloads.
        #
        # Supports OpenAI-style semantics (string model id) while enabling
        # optional per-model default settings for Dedalus multi-model routing.
        variant -> { DedalusSDK::DedalusModel }

        # List of models for multi-model routing.
        variant -> { DedalusSDK::Models::ResponseCreateParams::Model::DedalusModelChoiceArray }

        # @!method self.variants
        #   @return [Array(String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>)]

        # @type [DedalusSDK::Internal::Type::Converter]
        DedalusModelChoiceArray =
          DedalusSDK::Internal::Type::ArrayOf[union: -> { DedalusSDK::DedalusModelChoice }]
      end

      # @see DedalusSDK::Models::ResponseCreateParams#prompt
      class Prompt < DedalusSDK::Internal::Type::BaseModel
        # @!attribute id
        #   Identifier of the stored prompt.
        #
        #   @return [String]
        required :id, String

        # @!attribute variables
        #   Variables to substitute into the stored prompt template.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :variables,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute version
        #   Optional version identifier of the stored prompt.
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(id:, variables: nil, version: nil)
        #   Stored prompt template reference (BYOK).
        #
        #   @param id [String] Identifier of the stored prompt.
        #
        #   @param variables [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Variables to substitute into the stored prompt template.
        #
        #   @param version [String, nil] Optional version identifier of the stored prompt.
      end

      # Specifies the processing type used for serving the request.
      #
      # - If set to 'auto', then the request will be processed with the service tier
      #   configured in the Project settings. Unless otherwise configured, the Project
      #   will use 'default'.
      # - If set to 'default', then the request will be processed with the standard
      #   pricing and performance for the selected model.
      # - If set to '[flex](https://platform.openai.com/docs/guides/flex-processing)' or
      #   '[priority](https://openai.com/api-priority-processing/)', then the request
      #   will be processed with the corresponding service tier.
      # - When not set, the default behavior is 'auto'.
      #
      # When the `service_tier` parameter is set, the response body will include the
      # `service_tier` value based on the processing mode actually used to serve the
      # request. This response value may be different from the value set in the
      # parameter.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#service_tier
      module ServiceTier
        extend DedalusSDK::Internal::Type::Enum

        AUTO = :auto
        DEFAULT = :default

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # How the model should select which tool (or tools) to use when generating a
      # response. See the `tools` parameter to see how to specify which tools the model
      # can call.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#tool_choice
      module ToolChoice
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant -> { DedalusSDK::JSONObjectInput }

        # @!method self.variants
        #   @return [Array(String, Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil})]
      end

      # The truncation strategy to use for the model response.
      #
      # - `auto`: If the input to this Response exceeds the model's context window size,
      #   the model will truncate the response to fit the context window by dropping
      #   items from the beginning of the conversation.
      # - `disabled` (default): If the input size will exceed the context window size
      #   for a model, the request will fail with a 400 error.
      #
      # @see DedalusSDK::Models::ResponseCreateParams#truncation
      module Truncation
        extend DedalusSDK::Internal::Type::Enum

        AUTO = :auto
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
