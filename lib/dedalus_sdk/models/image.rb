# frozen_string_literal: true

module DedalusSDK
  module Models
    class Image < DedalusSDK::Internal::Type::BaseModel
      # @!attribute b64_json
      #   Base64-encoded image data (if response_format=b64_json)
      #
      #   @return [String, nil]
      optional :b64_json, String, nil?: true

      # @!attribute revised_prompt
      #   Revised prompt used for generation (dall-e-3)
      #
      #   @return [String, nil]
      optional :revised_prompt, String, nil?: true

      # @!attribute url
      #   URL of the generated image (if response_format=url)
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(b64_json: nil, revised_prompt: nil, url: nil)
      #   Single image object.
      #
      #   @param b64_json [String, nil] Base64-encoded image data (if response_format=b64_json)
      #
      #   @param revised_prompt [String, nil] Revised prompt used for generation (dall-e-3)
      #
      #   @param url [String, nil] URL of the generated image (if response_format=url)
    end
  end
end
