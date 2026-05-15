# frozen_string_literal: true

module DedalusSDK
  module Models
    module Audio
      # @see DedalusSDK::Resources::Audio::Transcriptions#create
      class TranscriptionCreateParams < DedalusSDK::Internal::Type::BaseModel
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        # @!attribute file
        #
        #   @return [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
        required :file, DedalusSDK::Internal::Type::FileInput

        # @!attribute model
        #
        #   @return [String]
        required :model, String

        # @!attribute language
        #
        #   @return [String, nil]
        optional :language, String, nil?: true

        # @!attribute prompt
        #
        #   @return [String, nil]
        optional :prompt, String, nil?: true

        # @!attribute response_format
        #
        #   @return [String, nil]
        optional :response_format, String, nil?: true

        # @!attribute temperature
        #
        #   @return [Float, nil]
        optional :temperature, Float, nil?: true

        # @!method initialize(file:, model:, language: nil, prompt: nil, response_format: nil, temperature: nil, request_options: {})
        #   @param file [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
        #   @param model [String]
        #   @param language [String, nil]
        #   @param prompt [String, nil]
        #   @param response_format [String, nil]
        #   @param temperature [Float, nil]
        #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
