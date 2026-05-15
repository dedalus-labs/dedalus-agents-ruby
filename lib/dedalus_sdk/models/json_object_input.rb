# frozen_string_literal: true

module DedalusSDK
  module Models
    # @type [DedalusSDK::Internal::Type::Converter]
    JSONObjectInput =
      DedalusSDK::Internal::Type::HashOf[union: -> { DedalusSDK::JSONValueInput }, nil?: true]
  end
end
