# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::Models#list
    class ListModelsResponse < DedalusSDK::Internal::Type::BaseModel
      # @!attribute data
      #   List of available models
      #
      #   @return [Array<DedalusSDK::Models::Model>]
      required :data, -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Model] }

      # @!attribute object
      #   Response object type
      #
      #   @return [Symbol, DedalusSDK::Models::ListModelsResponse::Object, nil]
      optional :object, enum: -> { DedalusSDK::ListModelsResponse::Object }

      # @!method initialize(data:, object: nil)
      #   Response for /v1/models endpoint.
      #
      #   @param data [Array<DedalusSDK::Models::Model>] List of available models
      #
      #   @param object [Symbol, DedalusSDK::Models::ListModelsResponse::Object] Response object type

      # Response object type
      #
      # @see DedalusSDK::Models::ListModelsResponse#object
      module Object
        extend DedalusSDK::Internal::Type::Enum

        LIST = :list

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
