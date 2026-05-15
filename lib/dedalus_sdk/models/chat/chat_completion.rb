# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      # @see DedalusSDK::Resources::Chat::Completions#create
      #
      # @see DedalusSDK::Resources::Chat::Completions#create_streaming
      class ChatCompletion < DedalusSDK::Internal::Type::BaseModel
        # @!attribute id
        #   A unique identifier for the chat completion.
        #
        #   @return [String]
        required :id, String

        # @!attribute choices
        #   A list of chat completion choices. Can be more than one if `n` is greater
        #   than 1.
        #
        #   @return [Array<DedalusSDK::Models::Chat::Choice>]
        required :choices, -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::Choice] }

        # @!attribute created
        #   The Unix timestamp (in seconds) of when the chat completion was created.
        #
        #   @return [Integer]
        required :created, Integer

        # @!attribute model
        #   The model used for the chat completion.
        #
        #   @return [String]
        required :model, String

        # @!attribute object
        #   The object type, which is always `chat.completion`.
        #
        #   @return [Symbol, :"chat.completion"]
        required :object, const: :"chat.completion"

        # @!attribute correlation_id
        #   Stable session ID for cross-turn handoff state. Echo this on the next request to
        #   resume server-side execution.
        #
        #   @return [String, nil]
        optional :correlation_id, String, nil?: true

        # @!attribute deferred
        #   Server tools blocked on client results.
        #
        #   @return [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil]
        optional :deferred,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::DeferredCallResponse] },
                 nil?: true

        # @!attribute mcp_server_errors
        #   MCP server failures keyed by server name.
        #
        #   @return [Hash{Symbol=>DedalusSDK::Models::Chat::ChatCompletion::MCPServerError}, nil]
        optional :mcp_server_errors,
                 -> { DedalusSDK::Internal::Type::HashOf[DedalusSDK::Chat::ChatCompletion::MCPServerError] },
                 nil?: true

        # @!attribute mcp_tool_results
        #   Detailed results of MCP tool executions including inputs, outputs, and timing.
        #   Provides full visibility into server-side tool execution for debugging and audit
        #   purposes.
        #
        #   @return [Array<DedalusSDK::Models::MCPToolResult>, nil]
        optional :mcp_tool_results,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::MCPToolResult] },
                 nil?: true

        # @!attribute pending_tools
        #   Client tools to execute, with dependency ordering.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletion::PendingTool>, nil]
        optional :pending_tools,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletion::PendingTool] },
                 nil?: true

        # @!attribute server_results
        #   Completed server tool outputs keyed by call ID.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :server_results,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
                 nil?: true

        # @!attribute service_tier
        #   Specifies the processing type used for serving the request.
        #
        #   - If set to 'auto', then the request will be processed with the service tier
        #     configured in the Project settings. Unless otherwise configured, the Project
        #     will use 'default'.
        #   - If set to 'default', then the request will be processed with the standard
        #     pricing and performance for the selected model.
        #   - If set to '[flex](/docs/guides/flex-processing)' or
        #     '[priority](https://openai.com/api-priority-processing/)', then the request
        #     will be processed with the corresponding service tier.
        #   - When not set, the default behavior is 'auto'.
        #
        #   When the `service_tier` parameter is set, the response body will include the
        #   `service_tier` value based on the processing mode actually used to serve the
        #   request. This response value may be different from the value set in the
        #   parameter.
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletion::ServiceTier, nil]
        optional :service_tier, enum: -> { DedalusSDK::Chat::ChatCompletion::ServiceTier }, nil?: true

        # @!attribute system_fingerprint
        #   This fingerprint represents the backend configuration that the model runs with.
        #
        #   Can be used in conjunction with the `seed` request parameter to understand when
        #   backend changes have been made that might impact determinism.
        #
        #   @return [String, nil]
        optional :system_fingerprint, String

        # @!attribute tools_executed
        #   List of tool names that were executed server-side (e.g., MCP tools). Only
        #   present when tools were executed on the server rather than returned for
        #   client-side execution.
        #
        #   @return [Array<String>, nil]
        optional :tools_executed, DedalusSDK::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute turns_consumed
        #   Number of internal LLM calls made during this request. SDKs can sum this across
        #   their outer loop to track total LLM calls.
        #
        #   @return [Integer, nil]
        optional :turns_consumed, Integer, nil?: true

        # @!attribute usage
        #   Usage statistics for the completion request.
        #
        #   @return [DedalusSDK::Models::Chat::CompletionUsage, nil]
        optional :usage, -> { DedalusSDK::Chat::CompletionUsage }

        # @!method initialize(id:, choices:, created:, model:, correlation_id: nil, deferred: nil, mcp_server_errors: nil, mcp_tool_results: nil, pending_tools: nil, server_results: nil, service_tier: nil, system_fingerprint: nil, tools_executed: nil, turns_consumed: nil, usage: nil, object: :"chat.completion")
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletion} for more details.
        #
        #   Chat completion response for Dedalus API.
        #
        #   OpenAI-compatible chat completion response with Dedalus extensions. Maintains
        #   full compatibility with OpenAI API while providing additional features like
        #   server-side tool execution tracking and MCP error reporting.
        #
        #   @param id [String] A unique identifier for the chat completion.
        #
        #   @param choices [Array<DedalusSDK::Models::Chat::Choice>] A list of chat completion choices. Can be more than one if `n` is greater than 1
        #
        #   @param created [Integer] The Unix timestamp (in seconds) of when the chat completion was created.
        #
        #   @param model [String] The model used for the chat completion.
        #
        #   @param correlation_id [String, nil] Stable session ID for cross-turn handoff state. Echo this on the next request to
        #
        #   @param deferred [Array<DedalusSDK::Models::Chat::DeferredCallResponse>, nil] Server tools blocked on client results.
        #
        #   @param mcp_server_errors [Hash{Symbol=>DedalusSDK::Models::Chat::ChatCompletion::MCPServerError}, nil] MCP server failures keyed by server name.
        #
        #   @param mcp_tool_results [Array<DedalusSDK::Models::MCPToolResult>, nil] Detailed results of MCP tool executions including inputs, outputs, and timing. P
        #
        #   @param pending_tools [Array<DedalusSDK::Models::Chat::ChatCompletion::PendingTool>, nil] Client tools to execute, with dependency ordering.
        #
        #   @param server_results [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Completed server tool outputs keyed by call ID.
        #
        #   @param service_tier [Symbol, DedalusSDK::Models::Chat::ChatCompletion::ServiceTier, nil] Specifies the processing type used for serving the request.
        #
        #   @param system_fingerprint [String] This fingerprint represents the backend configuration that the model runs with.
        #
        #   @param tools_executed [Array<String>, nil] List of tool names that were executed server-side (e.g., MCP tools). Only presen
        #
        #   @param turns_consumed [Integer, nil] Number of internal LLM calls made during this request. SDKs can sum this across
        #
        #   @param usage [DedalusSDK::Models::Chat::CompletionUsage] Usage statistics for the completion request.
        #
        #   @param object [Symbol, :"chat.completion"] The object type, which is always `chat.completion`.

        class MCPServerError < DedalusSDK::Internal::Type::BaseModel
          # @!attribute message
          #   Human-readable error message.
          #
          #   @return [String]
          required :message, String

          # @!attribute code
          #   Machine-readable error code.
          #
          #   @return [String, nil]
          optional :code, String, nil?: true

          # @!attribute recommendation
          #   Suggested action for the user.
          #
          #   @return [String, nil]
          optional :recommendation, String, nil?: true

          # @!method initialize(message:, code: nil, recommendation: nil)
          #   Error details for a single MCP server failure.
          #
          #   @param message [String] Human-readable error message.
          #
          #   @param code [String, nil] Machine-readable error code.
          #
          #   @param recommendation [String, nil] Suggested action for the user.
        end

        class PendingTool < DedalusSDK::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this tool call.
          #
          #   @return [String]
          required :id, String

          # @!attribute arguments
          #   Input arguments for the tool call.
          #
          #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}]
          required :arguments,
                   -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] }

          # @!attribute name
          #   Name of the tool to execute.
          #
          #   @return [String]
          required :name, String

          # @!attribute dependencies
          #   IDs of other pending calls that must complete first.
          #
          #   @return [Array<String>, nil]
          optional :dependencies, DedalusSDK::Internal::Type::ArrayOf[String]

          # @!method initialize(id:, arguments:, name:, dependencies: nil)
          #   Client-side tool call the SDK must execute.
          #
          #   @param id [String] Unique identifier for this tool call.
          #
          #   @param arguments [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}] Input arguments for the tool call.
          #
          #   @param name [String] Name of the tool to execute.
          #
          #   @param dependencies [Array<String>] IDs of other pending calls that must complete first.
        end

        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletion#service_tier
        module ServiceTier
          extend DedalusSDK::Internal::Type::Enum

          AUTO = :auto
          DEFAULT = :default
          FLEX = :flex
          SCALE = :scale
          PRIORITY = :priority

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ChatCompletion = Chat::ChatCompletion
  end
end
