# typed: strong

module DedalusSDK
  module Models
    module Chat
      class PredictionContent < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::PredictionContent,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The content that should be matched when generating a model response. If
        # generated tokens would match this content, the entire model response can be
        # returned much more quickly.
        sig { returns(DedalusSDK::Chat::PredictionContent::Content::Variants) }
        attr_accessor :content

        # The type of the predicted content you want to provide. This type is currently
        # always `content`.
        sig { returns(Symbol) }
        attr_accessor :type

        # Static predicted output content, such as the content of a text file that is
        # being regenerated.
        #
        # Fields:
        #
        # - type (required): Literal["content"]
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #   ArrayTitle("PredictionContentArray")]
        sig do
          params(
            content: DedalusSDK::Chat::PredictionContent::Content::Variants,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The content that should be matched when generating a model response. If
          # generated tokens would match this content, the entire model response can be
          # returned much more quickly.
          content:,
          # The type of the predicted content you want to provide. This type is currently
          # always `content`.
          type: :content
        )
        end

        sig do
          override.returns(
            {
              content: DedalusSDK::Chat::PredictionContent::Content::Variants,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The content that should be matched when generating a model response. If
        # generated tokens would match this content, the entire model response can be
        # returned much more quickly.
        module Content
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[DedalusSDK::Chat::ChatCompletionContentPartTextParam]
              )
            end

          sig do
            override.returns(
              T::Array[DedalusSDK::Chat::PredictionContent::Content::Variants]
            )
          end
          def self.variants
          end

          ChatCompletionContentPartTextParamArray =
            T.let(
              DedalusSDK::Internal::Type::ArrayOf[
                DedalusSDK::Chat::ChatCompletionContentPartTextParam
              ],
              DedalusSDK::Internal::Type::Converter
            )
        end
      end
    end
  end
end
