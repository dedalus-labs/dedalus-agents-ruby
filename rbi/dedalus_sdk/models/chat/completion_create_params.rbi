# typed: strong

module DedalusSDK
  module Models
    module Chat
      class CompletionCreateParams < DedalusSDK::Models::Chat::ChatCompletionCreateParams
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::CompletionCreateParams,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig do
          params(request_options: DedalusSDK::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: DedalusSDK::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
