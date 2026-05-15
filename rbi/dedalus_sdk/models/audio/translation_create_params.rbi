# typed: strong

module DedalusSDK
  module Models
    module Audio
      class TranslationCreateParams < DedalusSDK::Internal::Type::BaseModel
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Audio::TranslationCreateParams,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig { returns(DedalusSDK::Internal::FileInput) }
        attr_accessor :file

        sig { returns(String) }
        attr_accessor :model

        sig { returns(T.nilable(String)) }
        attr_accessor :prompt

        sig { returns(T.nilable(String)) }
        attr_accessor :response_format

        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        sig do
          params(
            file: DedalusSDK::Internal::FileInput,
            model: String,
            prompt: T.nilable(String),
            response_format: T.nilable(String),
            temperature: T.nilable(Float),
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          file:,
          model:,
          prompt: nil,
          response_format: nil,
          temperature: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              file: DedalusSDK::Internal::FileInput,
              model: String,
              prompt: T.nilable(String),
              response_format: T.nilable(String),
              temperature: T.nilable(Float),
              request_options: DedalusSDK::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
