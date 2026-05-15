# typed: strong

module DedalusSDK
  module Models
    class ResponseFormatText < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ResponseFormatText, DedalusSDK::Internal::AnyHash)
        end

      # The type of response format being defined. Always `text`.
      sig { returns(Symbol) }
      attr_accessor :type

      # Default response format. Used to generate text responses.
      #
      # Fields:
      #
      # - type (required): Literal["text"]
      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(
        # The type of response format being defined. Always `text`.
        type: :text
      )
      end

      sig { override.returns({ type: Symbol }) }
      def to_hash
      end
    end
  end
end
