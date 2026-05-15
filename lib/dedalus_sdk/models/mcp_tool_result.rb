# frozen_string_literal: true

module DedalusSDK
  module Models
    class MCPToolResult < DedalusSDK::Internal::Type::BaseModel
      # @!attribute arguments
      #   Input arguments passed to the tool.
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}]
      required :arguments,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] }

      # @!attribute is_error
      #   Whether the tool execution resulted in an error.
      #
      #   @return [Boolean]
      required :is_error, DedalusSDK::Internal::Type::Boolean

      # @!attribute server_name
      #   Name of the MCP server that handled the tool.
      #
      #   @return [String]
      required :server_name, String

      # @!attribute tool_name
      #   Name of the MCP tool that was executed.
      #
      #   @return [String]
      required :tool_name, String

      # @!attribute duration_ms
      #   Execution time in milliseconds.
      #
      #   @return [Integer, nil]
      optional :duration_ms, Integer, nil?: true

      # @!attribute result
      #   Structured result from the tool (parsed from structuredContent or content).
      #
      #   @return [String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil]
      optional :result, union: -> { DedalusSDK::JSONValueInput }, nil?: true

      # @!method initialize(arguments:, is_error:, server_name:, tool_name:, duration_ms: nil, result: nil)
      #   Result of a single MCP tool execution.
      #
      #   Provides visibility into MCP tool calls including the full input arguments and
      #   structured output, enabling debugging and audit trails.
      #
      #   @param arguments [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}] Input arguments passed to the tool.
      #
      #   @param is_error [Boolean] Whether the tool execution resulted in an error.
      #
      #   @param server_name [String] Name of the MCP server that handled the tool.
      #
      #   @param tool_name [String] Name of the MCP tool that was executed.
      #
      #   @param duration_ms [Integer, nil] Execution time in milliseconds.
      #
      #   @param result [String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil] Structured result from the tool (parsed from structuredContent or content).
    end
  end
end
