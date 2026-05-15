# frozen_string_literal: true

module DedalusSDK
  module Models
    class MCPServerSpec < DedalusSDK::Internal::Type::BaseModel
      # @!attribute name
      #   Server instance name for credential matching.
      #
      #   @return [String]
      required :name, String

      # @!attribute credentials
      #   Encrypted credential blobs keyed by connection name. Values are base64url
      #   ciphertext produced by the SDK (client-side encryption with the AS public key).
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :credentials, DedalusSDK::Internal::Type::HashOf[String], nil?: true

      # @!attribute slug
      #   Marketplace identifier.
      #
      #   @return [String, nil]
      optional :slug, String, nil?: true

      # @!attribute url
      #   Direct URL to MCP server endpoint (Pro users).
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!attribute version
      #   Version constraint for slug-based servers.
      #
      #   @return [String, nil]
      optional :version, String, nil?: true

      # @!method initialize(name:, credentials: nil, slug: nil, url: nil, version: nil)
      #   Some parameter documentations has been truncated, see
      #   {DedalusSDK::Models::MCPServerSpec} for more details.
      #
      #   Structured MCP server specification.
      #
      #   Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration",
      #   "version": "v1.0.0"} URL-based: {"url":
      #   "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
      #
      #   @param name [String] Server instance name for credential matching.
      #
      #   @param credentials [Hash{Symbol=>String}, nil] Encrypted credential blobs keyed by connection name. Values are base64url cipher
      #
      #   @param slug [String, nil] Marketplace identifier.
      #
      #   @param url [String, nil] Direct URL to MCP server endpoint (Pro users).
      #
      #   @param version [String, nil] Version constraint for slug-based servers.
    end
  end
end
