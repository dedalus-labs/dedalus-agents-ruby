# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionChunk < DedalusSDK::Internal::Type::BaseModel
        # @!attribute id
        #   A unique identifier for the chat completion. Each chunk has the same ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute choices
        #   A list of chat completion choices. Can contain more than one elements if `n` is
        #   greater than 1. Can also be empty for the last chunk if you set
        #   `stream_options: {"include_usage": true}`.
        #
        #   @return [Array<DedalusSDK::Models::Chat::StreamChoice>]
        required :choices, -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::StreamChoice] }

        # @!attribute created
        #   The Unix timestamp (in seconds) of when the chat completion was created. Each
        #   chunk has the same timestamp.
        #
        #   @return [Integer]
        required :created, Integer

        # @!attribute model
        #   The model to generate the completion.
        #
        #   @return [String]
        required :model, String

        # @!attribute object
        #   The object type, which is always `chat.completion.chunk`.
        #
        #   @return [Symbol, :"chat.completion.chunk"]
        required :object, const: :"chat.completion.chunk"

        # @!attribute service_tier
        #   Specifies the processing type used for serving the request.
        #
        #   - If set to 'auto', then the request will be processed with the service tier
        #     configured in the Project settings. Unless otherwise configured, the Project
        #     will use 'default'.
        #   - If set to 'default', then the request will be processed with the standard
        #     pricing and performance for the selected model.
        #   - If set to '[flex](/docs/guides/flex-processing)' or
        #     '[priority](https://openai.com/api-priority-processing/)', then the request
        #     will be processed with the corresponding service tier.
        #   - When not set, the default behavior is 'auto'.
        #
        #   When the `service_tier` parameter is set, the response body will include the
        #   `service_tier` value based on the processing mode actually used to serve the
        #   request. This response value may be different from the value set in the
        #   parameter.
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionChunk::ServiceTier, nil]
        optional :service_tier, enum: -> { DedalusSDK::Chat::ChatCompletionChunk::ServiceTier }, nil?: true

        # @!attribute system_fingerprint
        #   This fingerprint represents the backend configuration that the model runs with.
        #   Can be used in conjunction with the `seed` request parameter to understand when
        #   backend changes have been made that might impact determinism.
        #
        #   @return [String, nil]
        optional :system_fingerprint, String

        # @!attribute usage
        #   Usage statistics for the completion request.
        #
        #   Fields:
        #
        #   - completion_tokens (required): int
        #   - prompt_tokens (required): int
        #   - total_tokens (required): int
        #   - completion_tokens_details (optional): CompletionTokensDetails
        #   - prompt_tokens_details (optional): PromptTokensDetails
        #
        #   @return [DedalusSDK::Models::Chat::CompletionUsage, nil]
        optional :usage, -> { DedalusSDK::Chat::CompletionUsage }, nil?: true

        # @!method initialize(id:, choices:, created:, model:, service_tier: nil, system_fingerprint: nil, usage: nil, object: :"chat.completion.chunk")
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionChunk} for more details.
        #
        #   Represents a streamed chunk of a chat completion response returned by the model,
        #   based on the provided input. [Learn more](/docs/guides/streaming-responses).
        #
        #   Fields:
        #
        #   - id (required): str
        #   - choices (required): list[ChatCompletionStreamResponseChoicesItem]
        #   - created (required): int
        #   - model (required): str
        #   - service_tier (optional): ServiceTier
        #   - system_fingerprint (optional): str
        #   - object (required): Literal["chat.completion.chunk"]
        #   - usage (optional): CompletionUsage
        #
        #   @param id [String] A unique identifier for the chat completion. Each chunk has the same ID.
        #
        #   @param choices [Array<DedalusSDK::Models::Chat::StreamChoice>] A list of chat completion choices. Can contain more than one elements if `n` is
        #
        #   @param created [Integer] The Unix timestamp (in seconds) of when the chat completion was created. Each ch
        #
        #   @param model [String] The model to generate the completion.
        #
        #   @param service_tier [Symbol, DedalusSDK::Models::Chat::ChatCompletionChunk::ServiceTier, nil] Specifies the processing type used for serving the request.
        #
        #   @param system_fingerprint [String] This fingerprint represents the backend configuration that the model runs with.
        #
        #   @param usage [DedalusSDK::Models::Chat::CompletionUsage, nil] Usage statistics for the completion request.
        #
        #   @param object [Symbol, :"chat.completion.chunk"] The object type, which is always `chat.completion.chunk`.

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
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionChunk#service_tier
        module ServiceTier
          extend DedalusSDK::Internal::Type::Enum

          AUTO = :auto
          DEFAULT = :default
          FLEX = :flex
          SCALE = :scale
          PRIORITY = :priority

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ChatCompletionChunk = Chat::ChatCompletionChunk
  end
end
