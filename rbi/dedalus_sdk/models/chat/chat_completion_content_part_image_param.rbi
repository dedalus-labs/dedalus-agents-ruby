# typed: strong

module DedalusSDK
  module Models
    ChatCompletionContentPartImageParam =
      Chat::ChatCompletionContentPartImageParam

    module Chat
      class ChatCompletionContentPartImageParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionContentPartImageParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Schema for ImageUrl.
        #
        # Fields:
        #
        # - url (required): AnyUrl
        # - detail (optional): Literal["auto", "low", "high"]
        sig do
          returns(
            DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL
          )
        end
        attr_reader :image_url

        sig do
          params(
            image_url:
              DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::OrHash
          ).void
        end
        attr_writer :image_url

        # The type of the content part.
        sig { returns(Symbol) }
        attr_accessor :type

        # Learn about [image inputs](/docs/guides/vision).
        #
        # Fields:
        #
        # - type (required): Literal["image_url"]
        # - image_url (required): ImageUrl
        sig do
          params(
            image_url:
              DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for ImageUrl.
          #
          # Fields:
          #
          # - url (required): AnyUrl
          # - detail (optional): Literal["auto", "low", "high"]
          image_url:,
          # The type of the content part.
          type: :image_url
        )
        end

        sig do
          override.returns(
            {
              image_url:
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class ImageURL < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL,
                DedalusSDK::Internal::AnyHash
              )
            end

          # Either a URL of the image or the base64 encoded image data.
          sig { returns(String) }
          attr_accessor :url

          # Specifies the detail level of the image. Learn more in the
          # [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
          sig do
            returns(
              T.nilable(
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::OrSymbol
              )
            )
          end
          attr_reader :detail

          sig do
            params(
              detail:
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::OrSymbol
            ).void
          end
          attr_writer :detail

          # Schema for ImageUrl.
          #
          # Fields:
          #
          # - url (required): AnyUrl
          # - detail (optional): Literal["auto", "low", "high"]
          sig do
            params(
              url: String,
              detail:
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Either a URL of the image or the base64 encoded image data.
            url:,
            # Specifies the detail level of the image. Learn more in the
            # [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
            detail: nil
          )
          end

          sig do
            override.returns(
              {
                url: String,
                detail:
                  DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Specifies the detail level of the image. Learn more in the
          # [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
          module Detail
            extend DedalusSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO =
              T.let(
                :auto,
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::TaggedSymbol
              )
            LOW =
              T.let(
                :low,
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::TaggedSymbol
              )
            HIGH =
              T.let(
                :high,
                DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
