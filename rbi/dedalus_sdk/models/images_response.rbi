# typed: strong

module DedalusSDK
  module Models
    class ImagesResponse < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ImagesResponse, DedalusSDK::Internal::AnyHash)
        end

      # Unix timestamp when images were created
      sig { returns(Integer) }
      attr_accessor :created

      # List of generated images
      sig { returns(T::Array[DedalusSDK::Image]) }
      attr_accessor :data

      # Response from image generation.
      sig do
        params(
          created: Integer,
          data: T::Array[DedalusSDK::Image::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Unix timestamp when images were created
        created:,
        # List of generated images
        data:
      )
      end

      sig do
        override.returns(
          { created: Integer, data: T::Array[DedalusSDK::Image] }
        )
      end
      def to_hash
      end
    end
  end
end
