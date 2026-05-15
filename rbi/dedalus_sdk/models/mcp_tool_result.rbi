# typed: strong

module DedalusSDK
  module Models
    class MCPToolResult < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::MCPToolResult, DedalusSDK::Internal::AnyHash)
        end

      # Input arguments passed to the tool.
      sig do
        returns(
          T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
        )
      end
      attr_accessor :arguments

      # Whether the tool execution resulted in an error.
      sig { returns(T::Boolean) }
      attr_accessor :is_error

      # Name of the MCP server that handled the tool.
      sig { returns(String) }
      attr_accessor :server_name

      # Name of the MCP tool that was executed.
      sig { returns(String) }
      attr_accessor :tool_name

      # Execution time in milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :duration_ms

      # Structured result from the tool (parsed from structuredContent or content).
      sig { returns(T.nilable(DedalusSDK::JSONValueInput::Variants)) }
      attr_accessor :result

      # Result of a single MCP tool execution.
      #
      # Provides visibility into MCP tool calls including the full input arguments and
      # structured output, enabling debugging and audit trails.
      sig do
        params(
          arguments:
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)],
          is_error: T::Boolean,
          server_name: String,
          tool_name: String,
          duration_ms: T.nilable(Integer),
          result: T.nilable(DedalusSDK::JSONValueInput::Variants)
        ).returns(T.attached_class)
      end
      def self.new(
        # Input arguments passed to the tool.
        arguments:,
        # Whether the tool execution resulted in an error.
        is_error:,
        # Name of the MCP server that handled the tool.
        server_name:,
        # Name of the MCP tool that was executed.
        tool_name:,
        # Execution time in milliseconds.
        duration_ms: nil,
        # Structured result from the tool (parsed from structuredContent or content).
        result: nil
      )
      end

      sig do
        override.returns(
          {
            arguments:
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)],
            is_error: T::Boolean,
            server_name: String,
            tool_name: String,
            duration_ms: T.nilable(Integer),
            result: T.nilable(DedalusSDK::JSONValueInput::Variants)
          }
        )
      end
      def to_hash
      end
    end
  end
end
