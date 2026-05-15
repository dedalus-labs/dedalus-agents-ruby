# frozen_string_literal: true

module DedalusSDK
  module Models
    # Structured MCP server specification.
    #
    # Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration",
    # "version": "v1.0.0"} URL-based: {"url":
    # "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
    module MCPServerItem
      extend DedalusSDK::Internal::Type::Union

      variant String

      # Structured MCP server specification.
      #
      # Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration", "version": "v1.0.0"}
      # URL-based:  {"url": "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
      variant -> { DedalusSDK::MCPServerSpec }

      # @!method self.variants
      #   @return [Array(String, DedalusSDK::Models::MCPServerSpec)]
    end

    # @type [DedalusSDK::Internal::Type::Converter]
    MCPServers = DedalusSDK::Internal::Type::ArrayOf[union: -> { DedalusSDK::MCPServerItem }]
  end
end
