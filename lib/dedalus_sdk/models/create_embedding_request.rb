# frozen_string_literal: true

module DedalusSDK
  module Models
    class CreateEmbeddingRequest < DedalusSDK::Internal::Type::BaseModel
      # @!attribute input
      #   Input text to embed, encoded as a string or array of tokens. To embed multiple
      #   inputs in a single request, pass an array of strings or array of token arrays.
      #   The input must not exceed the max input tokens for the model (8192 tokens for
      #   all embedding models), cannot be an empty string, and any array must be 2048
      #   dimensions or less.
      #   [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken)
      #   for counting tokens. In addition to the per-input token limit, all embedding
      #   models enforce a maximum of 300,000 tokens summed across all inputs in a single
      #   request.
      #
      #   @return [String, Array<String>, Array<Integer>, Array<Array<Integer>>]
      required :input, union: -> { DedalusSDK::CreateEmbeddingRequest::Input }

      # @!attribute model
      #   ID of the model to use. You can use the
      #   [List models](/docs/api-reference/models/list) API to see all of your available
      #   models, or see our [Model overview](/docs/models) for descriptions of them.
      #
      #   @return [String, Symbol, DedalusSDK::Models::CreateEmbeddingRequest::Model]
      required :model, union: -> { DedalusSDK::CreateEmbeddingRequest::Model }

      # @!attribute dimensions
      #   The number of dimensions the resulting output embeddings should have. Only
      #   supported in `text-embedding-3` and later models.
      #
      #   @return [Integer, nil]
      optional :dimensions, Integer

      # @!attribute encoding_format
      #   The format to return the embeddings in. Can be either `float` or
      #   [`base64`](https://pypi.org/project/pybase64/).
      #
      #   @return [Symbol, DedalusSDK::Models::CreateEmbeddingRequest::EncodingFormat, nil]
      optional :encoding_format, enum: -> { DedalusSDK::CreateEmbeddingRequest::EncodingFormat }

      # @!attribute user
      #   A unique identifier representing your end-user, which can help OpenAI to monitor
      #   and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
      #
      #   @return [String, nil]
      optional :user, String

      # @!method initialize(input:, model:, dimensions: nil, encoding_format: nil, user: nil)
      #   Some parameter documentations has been truncated, see
      #   {DedalusSDK::Models::CreateEmbeddingRequest} for more details.
      #
      #   Schema for EmbeddingRequest.
      #
      #   Fields:
      #
      #   - input (required): str | Annotated[list[str], MinLen(1), MaxLen(2048),
      #     ArrayTitle("EmbeddingRequestInputArray")] | Annotated[list[int], MinLen(1),
      #     MaxLen(2048), ArrayTitle("EmbeddingRequestInputArray")] |
      #     Annotated[list[Annotated[list[int], MinLen(1),
      #     ArrayTitle("EmbeddingRequestInputItemArray")]], MinLen(1), MaxLen(2048),
      #     ArrayTitle("EmbeddingRequestInputArray")]
      #   - model (required): str | Literal["text-embedding-ada-002",
      #     "text-embedding-3-small", "text-embedding-3-large"]
      #   - encoding_format (optional): Literal["float", "base64"]
      #   - dimensions (optional): int
      #   - user (optional): str
      #
      #   @param input [String, Array<String>, Array<Integer>, Array<Array<Integer>>] Input text to embed, encoded as a string or array of tokens. To embed multiple i
      #
      #   @param model [String, Symbol, DedalusSDK::Models::CreateEmbeddingRequest::Model] ID of the model to use. You can use the [List models](/docs/api-reference/models
      #
      #   @param dimensions [Integer] The number of dimensions the resulting output embeddings should have. Only suppo
      #
      #   @param encoding_format [Symbol, DedalusSDK::Models::CreateEmbeddingRequest::EncodingFormat] The format to return the embeddings in. Can be either `float` or [`base64`](http
      #
      #   @param user [String] A unique identifier representing your end-user, which can help OpenAI to monitor

      # Input text to embed, encoded as a string or array of tokens. To embed multiple
      # inputs in a single request, pass an array of strings or array of token arrays.
      # The input must not exceed the max input tokens for the model (8192 tokens for
      # all embedding models), cannot be an empty string, and any array must be 2048
      # dimensions or less.
      # [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken)
      # for counting tokens. In addition to the per-input token limit, all embedding
      # models enforce a maximum of 300,000 tokens summed across all inputs in a single
      # request.
      #
      # @see DedalusSDK::Models::CreateEmbeddingRequest#input
      module Input
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant -> { DedalusSDK::Models::CreateEmbeddingRequest::Input::StringArray }

        variant -> { DedalusSDK::Models::CreateEmbeddingRequest::Input::IntegerArray }

        variant -> { DedalusSDK::Models::CreateEmbeddingRequest::Input::EmbeddingRequestInput2DArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>, Array<Integer>, Array<Array<Integer>>)]

        # @type [DedalusSDK::Internal::Type::Converter]
        StringArray = DedalusSDK::Internal::Type::ArrayOf[String]

        # @type [DedalusSDK::Internal::Type::Converter]
        IntegerArray = DedalusSDK::Internal::Type::ArrayOf[Integer]

        # @type [DedalusSDK::Internal::Type::Converter]
        EmbeddingRequestInput2DArray =
          DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::ArrayOf[Integer]]
      end

      # ID of the model to use. You can use the
      # [List models](/docs/api-reference/models/list) API to see all of your available
      # models, or see our [Model overview](/docs/models) for descriptions of them.
      #
      # @see DedalusSDK::Models::CreateEmbeddingRequest#model
      module Model
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant const: -> { DedalusSDK::Models::CreateEmbeddingRequest::Model::TEXT_EMBEDDING_ADA_002 }

        variant const: -> { DedalusSDK::Models::CreateEmbeddingRequest::Model::TEXT_EMBEDDING_3_SMALL }

        variant const: -> { DedalusSDK::Models::CreateEmbeddingRequest::Model::TEXT_EMBEDDING_3_LARGE }

        # @!method self.variants
        #   @return [Array(String, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(String, DedalusSDK::CreateEmbeddingRequest::Model::TaggedSymbol) }
        end

        # @!group

        TEXT_EMBEDDING_ADA_002 = :"text-embedding-ada-002"
        TEXT_EMBEDDING_3_SMALL = :"text-embedding-3-small"
        TEXT_EMBEDDING_3_LARGE = :"text-embedding-3-large"

        # @!endgroup
      end

      # The format to return the embeddings in. Can be either `float` or
      # [`base64`](https://pypi.org/project/pybase64/).
      #
      # @see DedalusSDK::Models::CreateEmbeddingRequest#encoding_format
      module EncodingFormat
        extend DedalusSDK::Internal::Type::Enum

        FLOAT = :float
        BASE64 = :base64

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
