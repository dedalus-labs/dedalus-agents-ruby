# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::Models#retrieve
    class ModelRetrieveParams < DedalusSDK::Internal::Type::BaseModel
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      # @!attribute model_id
      #
      #   @return [String]
      required :model_id, String

      # @!method initialize(model_id:, request_options: {})
      #   @param model_id [String]
      #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
