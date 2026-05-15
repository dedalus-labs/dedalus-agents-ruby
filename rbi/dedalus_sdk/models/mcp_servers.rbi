# typed: strong

module DedalusSDK
  module Models
    # Structured MCP server specification.
    #
    # Slug-based: {"slug": "dedalus-labs/brave-search", "name": "github-integration",
    # "version": "v1.0.0"} URL-based: {"url":
    # "https://mcp.dedaluslabs.ai/acme/my-server/mcp", "name": "custom-server"}
    module MCPServerItem
      extend DedalusSDK::Internal::Type::Union

      Variants = T.type_alias { T.any(String, DedalusSDK::MCPServerSpec) }

      sig { override.returns(T::Array[DedalusSDK::MCPServerItem::Variants]) }
      def self.variants
      end
    end

    MCPServers =
      T.let(
        DedalusSDK::Internal::Type::ArrayOf[union: DedalusSDK::MCPServerItem],
        DedalusSDK::Internal::Type::Converter
      )
  end
end
