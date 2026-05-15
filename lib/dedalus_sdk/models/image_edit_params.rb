# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::Images#edit
    class ImageEditParams < DedalusSDK::Internal::Type::BaseModel
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      # @!attribute image
      #
      #   @return [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
      required :image, DedalusSDK::Internal::Type::FileInput

      # @!attribute prompt
      #
      #   @return [String]
      required :prompt, String

      # @!attribute mask
      #
      #   @return [Pathname, StringIO, IO, String, DedalusSDK::FilePart, nil]
      optional :mask, DedalusSDK::Internal::Type::FileInput, nil?: true

      # @!attribute model
      #
      #   @return [String, nil]
      optional :model, String, nil?: true

      # @!attribute n
      #
      #   @return [Integer, nil]
      optional :n, Integer, nil?: true

      # @!attribute response_format
      #
      #   @return [String, nil]
      optional :response_format, String, nil?: true

      # @!attribute size
      #
      #   @return [String, nil]
      optional :size, String, nil?: true

      # @!attribute user
      #
      #   @return [String, nil]
      optional :user, String, nil?: true

      # @!method initialize(image:, prompt:, mask: nil, model: nil, n: nil, response_format: nil, size: nil, user: nil, request_options: {})
      #   @param image [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
      #   @param prompt [String]
      #   @param mask [Pathname, StringIO, IO, String, DedalusSDK::FilePart, nil]
      #   @param model [String, nil]
      #   @param n [Integer, nil]
      #   @param response_format [String, nil]
      #   @param size [String, nil]
      #   @param user [String, nil]
      #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
