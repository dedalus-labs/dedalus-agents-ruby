# frozen_string_literal: true

module DedalusSDK
  module Models
    class Credential < DedalusSDK::Internal::Type::BaseModel
      # @!attribute connection_name
      #   Connection name. Must match a connection in MCPServer.connections.
      #
      #   @return [String]
      required :connection_name, String

      # @!attribute values
      #   Credential values. Keys are credential field names, values are the secrets.
      #
      #   @return [Hash{Symbol=>String, Integer, Boolean}]
      required :values, -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::Credential::Value] }

      # @!method initialize(connection_name:, values:)
      #   Credential for MCP server authentication.
      #
      #   Passed at endpoint level (e.g., chat.completions.create) and matched to MCP
      #   servers by connection name. Wire format matches
      #   dedalus_mcp.Credential.to_dict().
      #
      #   @param connection_name [String] Connection name. Must match a connection in MCPServer.connections.
      #
      #   @param values [Hash{Symbol=>String, Integer, Boolean}] Credential values. Keys are credential field names, values are the secrets.

      module Value
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant Integer

        variant DedalusSDK::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Integer, Boolean)]
      end
    end
  end
end
