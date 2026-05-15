# typed: strong

module DedalusSDK
  module Models
    class Image < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(DedalusSDK::Image, DedalusSDK::Internal::AnyHash) }

      # Base64-encoded image data (if response_format=b64_json)
      sig { returns(T.nilable(String)) }
      attr_accessor :b64_json

      # Revised prompt used for generation (dall-e-3)
      sig { returns(T.nilable(String)) }
      attr_accessor :revised_prompt

      # URL of the generated image (if response_format=url)
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # Single image object.
      sig do
        params(
          b64_json: T.nilable(String),
          revised_prompt: T.nilable(String),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Base64-encoded image data (if response_format=b64_json)
        b64_json: nil,
        # Revised prompt used for generation (dall-e-3)
        revised_prompt: nil,
        # URL of the generated image (if response_format=url)
        url: nil
      )
      end

      sig do
        override.returns(
          {
            b64_json: T.nilable(String),
            revised_prompt: T.nilable(String),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
