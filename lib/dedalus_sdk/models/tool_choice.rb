# frozen_string_literal: true

module DedalusSDK
  module Models
    module ToolChoice
      extend DedalusSDK::Internal::Type::Union

      variant const: -> { DedalusSDK::Models::ToolChoice::AUTO }

      variant const: -> { DedalusSDK::Models::ToolChoice::REQUIRED }

      variant const: -> { DedalusSDK::Models::ToolChoice::NONE }

      variant String

      variant -> { DedalusSDK::Models::ToolChoice::UnionMember2Map }

      variant -> { DedalusSDK::ToolChoice::MCPToolChoice }

      class MCPToolChoice < DedalusSDK::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute server_label
        #
        #   @return [String]
        required :server_label, String

        # @!method initialize(name:, server_label:)
        #   @param name [String]
        #   @param server_label [String]
      end

      # @!method self.variants
      #   @return [Array(Symbol, String, Hash{Symbol=>Object}, DedalusSDK::Models::ToolChoice::MCPToolChoice)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(
            DedalusSDK::ToolChoice::TaggedSymbol,
            String,
            T::Hash[Symbol, T.anything],
            DedalusSDK::ToolChoice::MCPToolChoice
          )
        end
      end

      # @!group

      AUTO = :auto
      REQUIRED = :required
      NONE = :none

      # @!endgroup

      # @type [DedalusSDK::Internal::Type::Converter]
      UnionMember2Map = DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]
    end
  end
end
