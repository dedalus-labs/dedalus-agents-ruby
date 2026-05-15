# typed: strong

module DedalusSDK
  module Models
    class ImageEditParams < DedalusSDK::Internal::Type::BaseModel
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ImageEditParams, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(DedalusSDK::Internal::FileInput) }
      attr_accessor :image

      sig { returns(String) }
      attr_accessor :prompt

      sig { returns(T.nilable(DedalusSDK::Internal::FileInput)) }
      attr_accessor :mask

      sig { returns(T.nilable(String)) }
      attr_accessor :model

      sig { returns(T.nilable(Integer)) }
      attr_accessor :n

      sig { returns(T.nilable(String)) }
      attr_accessor :response_format

      sig { returns(T.nilable(String)) }
      attr_accessor :size

      sig { returns(T.nilable(String)) }
      attr_accessor :user

      sig do
        params(
          image: DedalusSDK::Internal::FileInput,
          prompt: String,
          mask: T.nilable(DedalusSDK::Internal::FileInput),
          model: T.nilable(String),
          n: T.nilable(Integer),
          response_format: T.nilable(String),
          size: T.nilable(String),
          user: T.nilable(String),
          request_options: DedalusSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        image:,
        prompt:,
        mask: nil,
        model: nil,
        n: nil,
        response_format: nil,
        size: nil,
        user: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            image: DedalusSDK::Internal::FileInput,
            prompt: String,
            mask: T.nilable(DedalusSDK::Internal::FileInput),
            model: T.nilable(String),
            n: T.nilable(Integer),
            response_format: T.nilable(String),
            size: T.nilable(String),
            user: T.nilable(String),
            request_options: DedalusSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
