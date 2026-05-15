# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      # @see DedalusSDK::Resources::Chat::Completions#create
      #
      # @see DedalusSDK::Resources::Chat::Completions#create_streaming
      class CompletionCreateParams < DedalusSDK::Models::Chat::ChatCompletionCreateParams
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
