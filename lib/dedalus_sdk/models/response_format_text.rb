# frozen_string_literal: true

module DedalusSDK
  module Models
    class ResponseFormatText < DedalusSDK::Internal::Type::BaseModel
      # @!attribute type
      #   The type of response format being defined. Always `text`.
      #
      #   @return [Symbol, :text]
      required :type, const: :text

      # @!method initialize(type: :text)
      #   Default response format. Used to generate text responses.
      #
      #   Fields:
      #
      #   - type (required): Literal["text"]
      #
      #   @param type [Symbol, :text] The type of response format being defined. Always `text`.
    end
  end
end
