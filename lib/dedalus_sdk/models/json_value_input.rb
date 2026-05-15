# frozen_string_literal: true

module DedalusSDK
  module Models
    module JSONValueInput
      extend DedalusSDK::Internal::Type::Union

      variant String

      variant Float

      variant DedalusSDK::Internal::Type::Boolean

      variant -> { DedalusSDK::Models::JSONValueInput::JSONValueInputMap }

      variant -> { DedalusSDK::Models::JSONValueInput::JSONValueInputArray }

      # @!method self.variants
      #   @return [Array(String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>)]

      # @type [DedalusSDK::Internal::Type::Converter]
      JSONValueInputMap =
        DedalusSDK::Internal::Type::HashOf[union: -> { DedalusSDK::JSONValueInput }, nil?: true]

      # @type [DedalusSDK::Internal::Type::Converter]
      JSONValueInputArray =
        DedalusSDK::Internal::Type::ArrayOf[union: -> { DedalusSDK::JSONValueInput }, nil?: true]
    end
  end
end
