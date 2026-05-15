# typed: strong

module DedalusSDK
  module Models
    ChatCompletionChunk = Chat::ChatCompletionChunk

    module Chat
      class ChatCompletionChunk < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionChunk,
              DedalusSDK::Internal::AnyHash
            )
          end

        # A unique identifier for the chat completion. Each chunk has the same ID.
        sig { returns(String) }
        attr_accessor :id

        # A list of chat completion choices. Can contain more than one elements if `n` is
        # greater than 1. Can also be empty for the last chunk if you set
        # `stream_options: {"include_usage": true}`.
        sig { returns(T::Array[DedalusSDK::Chat::StreamChoice]) }
        attr_accessor :choices

        # The Unix timestamp (in seconds) of when the chat completion was created. Each
        # chunk has the same timestamp.
        sig { returns(Integer) }
        attr_accessor :created

        # The model to generate the completion.
        sig { returns(String) }
        attr_accessor :model

        # The object type, which is always `chat.completion.chunk`.
        sig { returns(Symbol) }
        attr_accessor :object

        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )
          )
        end
        attr_accessor :service_tier

        # This fingerprint represents the backend configuration that the model runs with.
        # Can be used in conjunction with the `seed` request parameter to understand when
        # backend changes have been made that might impact determinism.
        sig { returns(T.nilable(String)) }
        attr_reader :system_fingerprint

        sig { params(system_fingerprint: String).void }
        attr_writer :system_fingerprint

        # Usage statistics for the completion request.
        #
        # Fields:
        #
        # - completion_tokens (required): int
        # - prompt_tokens (required): int
        # - total_tokens (required): int
        # - completion_tokens_details (optional): CompletionTokensDetails
        # - prompt_tokens_details (optional): PromptTokensDetails
        sig { returns(T.nilable(DedalusSDK::Chat::CompletionUsage)) }
        attr_reader :usage

        sig do
          params(
            usage: T.nilable(DedalusSDK::Chat::CompletionUsage::OrHash)
          ).void
        end
        attr_writer :usage

        # Represents a streamed chunk of a chat completion response returned by the model,
        # based on the provided input. [Learn more](/docs/guides/streaming-responses).
        #
        # Fields:
        #
        # - id (required): str
        # - choices (required): list[ChatCompletionStreamResponseChoicesItem]
        # - created (required): int
        # - model (required): str
        # - service_tier (optional): ServiceTier
        # - system_fingerprint (optional): str
        # - object (required): Literal["chat.completion.chunk"]
        # - usage (optional): CompletionUsage
        sig do
          params(
            id: String,
            choices: T::Array[DedalusSDK::Chat::StreamChoice::OrHash],
            created: Integer,
            model: String,
            service_tier:
              T.nilable(
                DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::OrSymbol
              ),
            system_fingerprint: String,
            usage: T.nilable(DedalusSDK::Chat::CompletionUsage::OrHash),
            object: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier for the chat completion. Each chunk has the same ID.
          id:,
          # A list of chat completion choices. Can contain more than one elements if `n` is
          # greater than 1. Can also be empty for the last chunk if you set
          # `stream_options: {"include_usage": true}`.
          choices:,
          # The Unix timestamp (in seconds) of when the chat completion was created. Each
          # chunk has the same timestamp.
          created:,
          # The model to generate the completion.
          model:,
          # Specifies the processing type used for serving the request.
          #
          # - If set to 'auto', then the request will be processed with the service tier
          #   configured in the Project settings. Unless otherwise configured, the Project
          #   will use 'default'.
          # - If set to 'default', then the request will be processed with the standard
          #   pricing and performance for the selected model.
          # - If set to '[flex](/docs/guides/flex-processing)' or
          #   '[priority](https://openai.com/api-priority-processing/)', then the request
          #   will be processed with the corresponding service tier.
          # - When not set, the default behavior is 'auto'.
          #
          # When the `service_tier` parameter is set, the response body will include the
          # `service_tier` value based on the processing mode actually used to serve the
          # request. This response value may be different from the value set in the
          # parameter.
          service_tier: nil,
          # This fingerprint represents the backend configuration that the model runs with.
          # Can be used in conjunction with the `seed` request parameter to understand when
          # backend changes have been made that might impact determinism.
          system_fingerprint: nil,
          # Usage statistics for the completion request.
          #
          # Fields:
          #
          # - completion_tokens (required): int
          # - prompt_tokens (required): int
          # - total_tokens (required): int
          # - completion_tokens_details (optional): CompletionTokensDetails
          # - prompt_tokens_details (optional): PromptTokensDetails
          usage: nil,
          # The object type, which is always `chat.completion.chunk`.
          object: :"chat.completion.chunk"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              choices: T::Array[DedalusSDK::Chat::StreamChoice],
              created: Integer,
              model: String,
              object: Symbol,
              service_tier:
                T.nilable(
                  DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
                ),
              system_fingerprint: String,
              usage: T.nilable(DedalusSDK::Chat::CompletionUsage)
            }
          )
        end
        def to_hash
        end

        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        module ServiceTier
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletionChunk::ServiceTier)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTO =
            T.let(
              :auto,
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )
          DEFAULT =
            T.let(
              :default,
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )
          FLEX =
            T.let(
              :flex,
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )
          SCALE =
            T.let(
              :scale,
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )
          PRIORITY =
            T.let(
              :priority,
              DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionChunk::ServiceTier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
