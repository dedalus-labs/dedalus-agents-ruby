# typed: strong

module DedalusSDK
  module Models
    module Chat
      class ChoiceLogprobs < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChoiceLogprobs,
              DedalusSDK::Internal::AnyHash
            )
          end

        # A list of message content tokens with log probability information.
        sig do
          returns(
            T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob])
          )
        end
        attr_accessor :content

        # A list of message refusal tokens with log probability information.
        sig do
          returns(
            T.nilable(T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob])
          )
        end
        attr_accessor :refusal

        # Log probability information for the choice.
        sig do
          params(
            content:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob::OrHash]
              ),
            refusal:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob::OrHash]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # A list of message content tokens with log probability information.
          content: nil,
          # A list of message refusal tokens with log probability information.
          refusal: nil
        )
        end

        sig do
          override.returns(
            {
              content:
                T.nilable(
                  T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob]
                ),
              refusal:
                T.nilable(
                  T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob]
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
