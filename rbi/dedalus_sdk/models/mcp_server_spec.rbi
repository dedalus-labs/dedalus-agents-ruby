# typed: strong

module DedalusSDK
  module Models
    class MCPServerSpec < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::MCPServerSpec, DedalusSDK::Internal::AnyHash)
        end

      # Server instance name for credential matching.
      sig { returns(String) }
      attr_accessor :name

      # Encrypted credential blobs keyed by connection name. Values are base64url
      # ciphertext produced by the SDK (client-side encryption with the AS public key).
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :credentials

      # Marketplace identifier.
      sig { returns(T.nilable(String)) }
      attr_accessor :slug

      # Direct URL to MCP server endpoint (Pro users).
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # Version constraint for slug-based servers.
      sig { returns(T.nilable(String)) }
      attr_accessor :version

      # Structured MCP server specification.
      #
      # Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration",
      # "version": "v1.0.0"} URL-based: {"url":
      # "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
      sig do
        params(
          name: String,
          credentials: T.nilable(T::Hash[Symbol, String]),
          slug: T.nilable(String),
          url: T.nilable(String),
          version: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Server instance name for credential matching.
        name:,
        # Encrypted credential blobs keyed by connection name. Values are base64url
        # ciphertext produced by the SDK (client-side encryption with the AS public key).
        credentials: nil,
        # Marketplace identifier.
        slug: nil,
        # Direct URL to MCP server endpoint (Pro users).
        url: nil,
        # Version constraint for slug-based servers.
        version: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            credentials: T.nilable(T::Hash[Symbol, String]),
            slug: T.nilable(String),
            url: T.nilable(String),
            version: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
