# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Embeddings
      # Some parameter documentations has been truncated, see
      # {DedalusSDK::Models::EmbeddingCreateParams} for more details.
      #
      # Create embeddings using the configured provider.
      #
      # @overload create(input:, model:, dimensions: nil, encoding_format: nil, user: nil, request_options: {})
      #
      # @param input [String, Array<String>, Array<Integer>, Array<Array<Integer>>] Input text to embed, encoded as a string or array of tokens. To embed multiple i
      #
      # @param model [String, Symbol, DedalusSDK::Models::CreateEmbeddingRequest::Model] ID of the model to use. You can use the [List models](/docs/api-reference/models
      #
      # @param dimensions [Integer] The number of dimensions the resulting output embeddings should have. Only suppo
      #
      # @param encoding_format [Symbol, DedalusSDK::Models::CreateEmbeddingRequest::EncodingFormat] The format to return the embeddings in. Can be either `float` or [`base64`](http
      #
      # @param user [String] A unique identifier representing your end-user, which can help OpenAI to monitor
      #
      # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DedalusSDK::Models::CreateEmbeddingResponse]
      #
      # @see DedalusSDK::Models::EmbeddingCreateParams
      def create(params)
        parsed, options = DedalusSDK::EmbeddingCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/embeddings",
          body: parsed,
          model: DedalusSDK::CreateEmbeddingResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DedalusSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
