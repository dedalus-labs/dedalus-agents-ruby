# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::Images#create_variation
    class ImagesResponse < DedalusSDK::Internal::Type::BaseModel
      # @!attribute created
      #   Unix timestamp when images were created
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute data
      #   List of generated images
      #
      #   @return [Array<DedalusSDK::Models::Image>]
      required :data, -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Image] }

      # @!method initialize(created:, data:)
      #   Response from image generation.
      #
      #   @param created [Integer] Unix timestamp when images were created
      #
      #   @param data [Array<DedalusSDK::Models::Image>] List of generated images
    end
  end
end
