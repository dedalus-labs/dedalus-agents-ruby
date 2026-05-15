# typed: strong

module DedalusSDK
  module Models
    class Credential < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::Credential, DedalusSDK::Internal::AnyHash)
        end

      # Connection name. Must match a connection in MCPServer.connections.
      sig { returns(String) }
      attr_accessor :connection_name

      # Credential values. Keys are credential field names, values are the secrets.
      sig { returns(T::Hash[Symbol, DedalusSDK::Credential::Value::Variants]) }
      attr_accessor :values

      # Credential for MCP server authentication.
      #
      # Passed at endpoint level (e.g., chat.completions.create) and matched to MCP
      # servers by connection name. Wire format matches
      # dedalus_mcp.Credential.to_dict().
      sig do
        params(
          connection_name: String,
          values: T::Hash[Symbol, DedalusSDK::Credential::Value::Variants]
        ).returns(T.attached_class)
      end
      def self.new(
        # Connection name. Must match a connection in MCPServer.connections.
        connection_name:,
        # Credential values. Keys are credential field names, values are the secrets.
        values:
      )
      end

      sig do
        override.returns(
          {
            connection_name: String,
            values: T::Hash[Symbol, DedalusSDK::Credential::Value::Variants]
          }
        )
      end
      def to_hash
      end

      module Value
        extend DedalusSDK::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Integer, T::Boolean) }

        sig do
          override.returns(T::Array[DedalusSDK::Credential::Value::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
