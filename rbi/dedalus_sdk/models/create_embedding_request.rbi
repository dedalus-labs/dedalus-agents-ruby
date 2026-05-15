# typed: strong

module DedalusSDK
  module Models
    class CreateEmbeddingRequest < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DedalusSDK::CreateEmbeddingRequest,
            DedalusSDK::Internal::AnyHash
          )
        end

      # Input text to embed, encoded as a string or array of tokens. To embed multiple
      # inputs in a single request, pass an array of strings or array of token arrays.
      # The input must not exceed the max input tokens for the model (8192 tokens for
      # all embedding models), cannot be an empty string, and any array must be 2048
      # dimensions or less.
      # [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken)
      # for counting tokens. In addition to the per-input token limit, all embedding
      # models enforce a maximum of 300,000 tokens summed across all inputs in a single
      # request.
      sig { returns(DedalusSDK::CreateEmbeddingRequest::Input::Variants) }
      attr_accessor :input

      # ID of the model to use. You can use the
      # [List models](/docs/api-reference/models/list) API to see all of your available
      # models, or see our [Model overview](/docs/models) for descriptions of them.
      sig do
        returns(
          T.any(String, DedalusSDK::CreateEmbeddingRequest::Model::OrSymbol)
        )
      end
      attr_accessor :model

      # The number of dimensions the resulting output embeddings should have. Only
      # supported in `text-embedding-3` and later models.
      sig { returns(T.nilable(Integer)) }
      attr_reader :dimensions

      sig { params(dimensions: Integer).void }
      attr_writer :dimensions

      # The format to return the embeddings in. Can be either `float` or
      # [`base64`](https://pypi.org/project/pybase64/).
      sig do
        returns(
          T.nilable(
            DedalusSDK::CreateEmbeddingRequest::EncodingFormat::OrSymbol
          )
        )
      end
      attr_reader :encoding_format

      sig do
        params(
          encoding_format:
            DedalusSDK::CreateEmbeddingRequest::EncodingFormat::OrSymbol
        ).void
      end
      attr_writer :encoding_format

      # A unique identifier representing your end-user, which can help OpenAI to monitor
      # and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
      sig { returns(T.nilable(String)) }
      attr_reader :user

      sig { params(user: String).void }
      attr_writer :user

      # Schema for EmbeddingRequest.
      #
      # Fields:
      #
      # - input (required): str | Annotated[list[str], MinLen(1), MaxLen(2048),
      #   ArrayTitle("EmbeddingRequestInputArray")] | Annotated[list[int], MinLen(1),
      #   MaxLen(2048), ArrayTitle("EmbeddingRequestInputArray")] |
      #   Annotated[list[Annotated[list[int], MinLen(1),
      #   ArrayTitle("EmbeddingRequestInputItemArray")]], MinLen(1), MaxLen(2048),
      #   ArrayTitle("EmbeddingRequestInputArray")]
      # - model (required): str | Literal["text-embedding-ada-002",
      #   "text-embedding-3-small", "text-embedding-3-large"]
      # - encoding_format (optional): Literal["float", "base64"]
      # - dimensions (optional): int
      # - user (optional): str
      sig do
        params(
          input: DedalusSDK::CreateEmbeddingRequest::Input::Variants,
          model:
            T.any(String, DedalusSDK::CreateEmbeddingRequest::Model::OrSymbol),
          dimensions: Integer,
          encoding_format:
            DedalusSDK::CreateEmbeddingRequest::EncodingFormat::OrSymbol,
          user: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Input text to embed, encoded as a string or array of tokens. To embed multiple
        # inputs in a single request, pass an array of strings or array of token arrays.
        # The input must not exceed the max input tokens for the model (8192 tokens for
        # all embedding models), cannot be an empty string, and any array must be 2048
        # dimensions or less.
        # [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken)
        # for counting tokens. In addition to the per-input token limit, all embedding
        # models enforce a maximum of 300,000 tokens summed across all inputs in a single
        # request.
        input:,
        # ID of the model to use. You can use the
        # [List models](/docs/api-reference/models/list) API to see all of your available
        # models, or see our [Model overview](/docs/models) for descriptions of them.
        model:,
        # The number of dimensions the resulting output embeddings should have. Only
        # supported in `text-embedding-3` and later models.
        dimensions: nil,
        # The format to return the embeddings in. Can be either `float` or
        # [`base64`](https://pypi.org/project/pybase64/).
        encoding_format: nil,
        # A unique identifier representing your end-user, which can help OpenAI to monitor
        # and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
        user: nil
      )
      end

      sig do
        override.returns(
          {
            input: DedalusSDK::CreateEmbeddingRequest::Input::Variants,
            model:
              T.any(
                String,
                DedalusSDK::CreateEmbeddingRequest::Model::OrSymbol
              ),
            dimensions: Integer,
            encoding_format:
              DedalusSDK::CreateEmbeddingRequest::EncodingFormat::OrSymbol,
            user: String
          }
        )
      end
      def to_hash
      end

      # Input text to embed, encoded as a string or array of tokens. To embed multiple
      # inputs in a single request, pass an array of strings or array of token arrays.
      # The input must not exceed the max input tokens for the model (8192 tokens for
      # all embedding models), cannot be an empty string, and any array must be 2048
      # dimensions or less.
      # [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken)
      # for counting tokens. In addition to the per-input token limit, all embedding
      # models enforce a maximum of 300,000 tokens summed across all inputs in a single
      # request.
      module Input
        extend DedalusSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[String],
              T::Array[Integer],
              T::Array[T::Array[Integer]]
            )
          end

        sig do
          override.returns(
            T::Array[DedalusSDK::CreateEmbeddingRequest::Input::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            DedalusSDK::Internal::Type::ArrayOf[String],
            DedalusSDK::Internal::Type::Converter
          )

        IntegerArray =
          T.let(
            DedalusSDK::Internal::Type::ArrayOf[Integer],
            DedalusSDK::Internal::Type::Converter
          )

        EmbeddingRequestInput2DArray =
          T.let(
            DedalusSDK::Internal::Type::ArrayOf[
              DedalusSDK::Internal::Type::ArrayOf[Integer]
            ],
            DedalusSDK::Internal::Type::Converter
          )
      end

      # ID of the model to use. You can use the
      # [List models](/docs/api-reference/models/list) API to see all of your available
      # models, or see our [Model overview](/docs/models) for descriptions of them.
      module Model
        extend DedalusSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              DedalusSDK::CreateEmbeddingRequest::Model::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[DedalusSDK::CreateEmbeddingRequest::Model::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DedalusSDK::CreateEmbeddingRequest::Model)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT_EMBEDDING_ADA_002 =
          T.let(
            :"text-embedding-ada-002",
            DedalusSDK::CreateEmbeddingRequest::Model::TaggedSymbol
          )
        TEXT_EMBEDDING_3_SMALL =
          T.let(
            :"text-embedding-3-small",
            DedalusSDK::CreateEmbeddingRequest::Model::TaggedSymbol
          )
        TEXT_EMBEDDING_3_LARGE =
          T.let(
            :"text-embedding-3-large",
            DedalusSDK::CreateEmbeddingRequest::Model::TaggedSymbol
          )
      end

      # The format to return the embeddings in. Can be either `float` or
      # [`base64`](https://pypi.org/project/pybase64/).
      module EncodingFormat
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DedalusSDK::CreateEmbeddingRequest::EncodingFormat)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FLOAT =
          T.let(
            :float,
            DedalusSDK::CreateEmbeddingRequest::EncodingFormat::TaggedSymbol
          )
        BASE64 =
          T.let(
            :base64,
            DedalusSDK::CreateEmbeddingRequest::EncodingFormat::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DedalusSDK::CreateEmbeddingRequest::EncodingFormat::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
