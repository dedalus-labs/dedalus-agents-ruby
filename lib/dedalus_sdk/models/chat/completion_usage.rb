# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class CompletionUsage < DedalusSDK::Internal::Type::BaseModel
        # @!attribute completion_tokens
        #   Number of tokens in the generated completion.
        #
        #   @return [Integer]
        required :completion_tokens, Integer

        # @!attribute prompt_tokens
        #   Number of tokens in the prompt.
        #
        #   @return [Integer]
        required :prompt_tokens, Integer

        # @!attribute total_tokens
        #   Total number of tokens used in the request (prompt + completion).
        #
        #   @return [Integer]
        required :total_tokens, Integer

        # @!attribute completion_tokens_details
        #   Breakdown of tokens used in a completion.
        #
        #   @return [DedalusSDK::Models::Chat::CompletionTokensDetails, nil]
        optional :completion_tokens_details, -> { DedalusSDK::Chat::CompletionTokensDetails }

        # @!attribute prompt_tokens_details
        #   Breakdown of tokens used in the prompt.
        #
        #   @return [DedalusSDK::Models::Chat::PromptTokensDetails, nil]
        optional :prompt_tokens_details, -> { DedalusSDK::Chat::PromptTokensDetails }

        # @!method initialize(completion_tokens:, prompt_tokens:, total_tokens:, completion_tokens_details: nil, prompt_tokens_details: nil)
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
        #   @param completion_tokens [Integer] Number of tokens in the generated completion.
        #
        #   @param prompt_tokens [Integer] Number of tokens in the prompt.
        #
        #   @param total_tokens [Integer] Total number of tokens used in the request (prompt + completion).
        #
        #   @param completion_tokens_details [DedalusSDK::Models::Chat::CompletionTokensDetails] Breakdown of tokens used in a completion.
        #
        #   @param prompt_tokens_details [DedalusSDK::Models::Chat::PromptTokensDetails] Breakdown of tokens used in the prompt.
      end
    end
  end
end
