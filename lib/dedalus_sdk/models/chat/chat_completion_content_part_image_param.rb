# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionContentPartImageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute image_url
        #   Schema for ImageUrl.
        #
        #   Fields:
        #
        #   - url (required): AnyUrl
        #   - detail (optional): Literal["auto", "low", "high"]
        #
        #   @return [DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL]
        required :image_url, -> { DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL }

        # @!attribute type
        #   The type of the content part.
        #
        #   @return [Symbol, :image_url]
        required :type, const: :image_url

        # @!method initialize(image_url:, type: :image_url)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam} for more
        #   details.
        #
        #   Learn about [image inputs](/docs/guides/vision).
        #
        #   Fields:
        #
        #   - type (required): Literal["image_url"]
        #   - image_url (required): ImageUrl
        #
        #   @param image_url [DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL] Schema for ImageUrl.
        #
        #   @param type [Symbol, :image_url] The type of the content part.

        # @see DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam#image_url
        class ImageURL < DedalusSDK::Internal::Type::BaseModel
          # @!attribute url
          #   Either a URL of the image or the base64 encoded image data.
          #
          #   @return [String]
          required :url, String

          # @!attribute detail
          #   Specifies the detail level of the image. Learn more in the
          #   [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
          #
          #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail, nil]
          optional :detail, enum: -> { DedalusSDK::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail }

          # @!method initialize(url:, detail: nil)
          #   Some parameter documentations has been truncated, see
          #   {DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL} for
          #   more details.
          #
          #   Schema for ImageUrl.
          #
          #   Fields:
          #
          #   - url (required): AnyUrl
          #   - detail (optional): Literal["auto", "low", "high"]
          #
          #   @param url [String] Either a URL of the image or the base64 encoded image data.
          #
          #   @param detail [Symbol, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL::Detail] Specifies the detail level of the image. Learn more in the [Vision guide](/docs/

          # Specifies the detail level of the image. Learn more in the
          # [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
          #
          # @see DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam::ImageURL#detail
          module Detail
            extend DedalusSDK::Internal::Type::Enum

            AUTO = :auto
            LOW = :low
            HIGH = :high

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end

    ChatCompletionContentPartImageParam = Chat::ChatCompletionContentPartImageParam
  end
end
