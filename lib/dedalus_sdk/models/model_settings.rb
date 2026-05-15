# frozen_string_literal: true

module DedalusSDK
  module Models
    class ModelSettings < DedalusSDK::Internal::Type::BaseModel
      # @!attribute attributes
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :attributes, DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]

      # @!attribute audio
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :audio,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute deferred
      #
      #   @return [Boolean, nil]
      optional :deferred, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute extra_args
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :extra_args,
               DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown],
               nil?: true

      # @!attribute extra_headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :extra_headers, DedalusSDK::Internal::Type::HashOf[String], nil?: true

      # @!attribute extra_query
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :extra_query,
               DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown],
               nil?: true

      # @!attribute frequency_penalty
      #
      #   @return [Float, nil]
      optional :frequency_penalty, Float, nil?: true

      # @!attribute generation_config
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :generation_config,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute include_usage
      #
      #   @return [Boolean, nil]
      optional :include_usage, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute input_audio_format
      #
      #   @return [String, nil]
      optional :input_audio_format, String, nil?: true

      # @!attribute input_audio_transcription
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :input_audio_transcription,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute logit_bias
      #
      #   @return [Hash{Symbol=>Integer}, nil]
      optional :logit_bias, DedalusSDK::Internal::Type::HashOf[Integer], nil?: true

      # @!attribute logprobs
      #
      #   @return [Boolean, nil]
      optional :logprobs, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute max_completion_tokens
      #
      #   @return [Integer, nil]
      optional :max_completion_tokens, Integer, nil?: true

      # @!attribute max_tokens
      #
      #   @return [Integer, nil]
      optional :max_tokens, Integer, nil?: true

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, DedalusSDK::Internal::Type::HashOf[String], nil?: true

      # @!attribute modalities
      #
      #   @return [Array<String>, nil]
      optional :modalities, DedalusSDK::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute n
      #
      #   @return [Integer, nil]
      optional :n, Integer, nil?: true

      # @!attribute output_audio_format
      #
      #   @return [String, nil]
      optional :output_audio_format, String, nil?: true

      # @!attribute parallel_tool_calls
      #
      #   @return [Boolean, nil]
      optional :parallel_tool_calls, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute prediction
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :prediction,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute presence_penalty
      #
      #   @return [Float, nil]
      optional :presence_penalty, Float, nil?: true

      # @!attribute prompt_cache_key
      #
      #   @return [String, nil]
      optional :prompt_cache_key, String, nil?: true

      # @!attribute reasoning
      #   **gpt-5 and o-series models only**
      #
      #   Configuration options for
      #   [reasoning models](https://platform.openai.com/docs/guides/reasoning).
      #
      #   @return [DedalusSDK::Models::Reasoning, nil]
      optional :reasoning, -> { DedalusSDK::Reasoning }, nil?: true

      # @!attribute reasoning_effort
      #
      #   @return [String, nil]
      optional :reasoning_effort, String, nil?: true

      # @!attribute response_format
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :response_format,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute safety_identifier
      #
      #   @return [String, nil]
      optional :safety_identifier, String, nil?: true

      # @!attribute safety_settings
      #
      #   @return [Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil]
      optional :safety_settings,
               -> {
                 DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                                                        nil?: true]]
               },
               nil?: true

      # @!attribute search_parameters
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :search_parameters,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute seed
      #
      #   @return [Integer, nil]
      optional :seed, Integer, nil?: true

      # @!attribute service_tier
      #
      #   @return [String, nil]
      optional :service_tier, String, nil?: true

      # @!attribute stop
      #
      #   @return [String, Array<String>, nil]
      optional :stop, union: -> { DedalusSDK::ModelSettings::Stop }, nil?: true

      # @!attribute store
      #
      #   @return [Boolean, nil]
      optional :store, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute stream
      #
      #   @return [Boolean, nil]
      optional :stream, DedalusSDK::Internal::Type::Boolean, nil?: true

      # @!attribute stream_options
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :stream_options,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute structured_output
      #
      #   @return [Object, nil]
      optional :structured_output, DedalusSDK::Internal::Type::Unknown

      # @!attribute system_instruction
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :system_instruction,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute temperature
      #
      #   @return [Float, nil]
      optional :temperature, Float, nil?: true

      # @!attribute thinking
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :thinking,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute timeout
      #
      #   @return [Float, nil]
      optional :timeout, Float, nil?: true

      # @!attribute tool_choice
      #
      #   @return [Symbol, String, Hash{Symbol=>Object}, DedalusSDK::Models::ToolChoice::MCPToolChoice, DedalusSDK::Models::ToolChoice, nil]
      optional :tool_choice, union: -> { DedalusSDK::ToolChoice }, nil?: true

      # @!attribute tool_config
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :tool_config,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute top_k
      #
      #   @return [Integer, nil]
      optional :top_k, Integer, nil?: true

      # @!attribute top_logprobs
      #
      #   @return [Integer, nil]
      optional :top_logprobs, Integer, nil?: true

      # @!attribute top_p
      #
      #   @return [Float, nil]
      optional :top_p, Float, nil?: true

      # @!attribute truncation
      #
      #   @return [Symbol, DedalusSDK::Models::ModelSettings::Truncation, nil]
      optional :truncation, enum: -> { DedalusSDK::ModelSettings::Truncation }, nil?: true

      # @!attribute turn_detection
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :turn_detection,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!attribute user
      #
      #   @return [String, nil]
      optional :user, String, nil?: true

      # @!attribute verbosity
      #
      #   @return [String, nil]
      optional :verbosity, String, nil?: true

      # @!attribute voice
      #
      #   @return [String, nil]
      optional :voice, String, nil?: true

      # @!attribute web_search_options
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      optional :web_search_options,
               -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] },
               nil?: true

      # @!method initialize(attributes: nil, audio: nil, deferred: nil, extra_args: nil, extra_headers: nil, extra_query: nil, frequency_penalty: nil, generation_config: nil, include_usage: nil, input_audio_format: nil, input_audio_transcription: nil, logit_bias: nil, logprobs: nil, max_completion_tokens: nil, max_tokens: nil, metadata: nil, modalities: nil, n: nil, output_audio_format: nil, parallel_tool_calls: nil, prediction: nil, presence_penalty: nil, prompt_cache_key: nil, reasoning: nil, reasoning_effort: nil, response_format: nil, safety_identifier: nil, safety_settings: nil, search_parameters: nil, seed: nil, service_tier: nil, stop: nil, store: nil, stream: nil, stream_options: nil, structured_output: nil, system_instruction: nil, temperature: nil, thinking: nil, timeout: nil, tool_choice: nil, tool_config: nil, top_k: nil, top_logprobs: nil, top_p: nil, truncation: nil, turn_detection: nil, user: nil, verbosity: nil, voice: nil, web_search_options: nil)
      #   Some parameter documentations has been truncated, see
      #   {DedalusSDK::Models::ModelSettings} for more details.
      #
      #   @param attributes [Hash{Symbol=>Object}]
      #
      #   @param audio [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param deferred [Boolean, nil]
      #
      #   @param extra_args [Hash{Symbol=>Object}, nil]
      #
      #   @param extra_headers [Hash{Symbol=>String}, nil]
      #
      #   @param extra_query [Hash{Symbol=>Object}, nil]
      #
      #   @param frequency_penalty [Float, nil]
      #
      #   @param generation_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param include_usage [Boolean, nil]
      #
      #   @param input_audio_format [String, nil]
      #
      #   @param input_audio_transcription [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param logit_bias [Hash{Symbol=>Integer}, nil]
      #
      #   @param logprobs [Boolean, nil]
      #
      #   @param max_completion_tokens [Integer, nil]
      #
      #   @param max_tokens [Integer, nil]
      #
      #   @param metadata [Hash{Symbol=>String}, nil]
      #
      #   @param modalities [Array<String>, nil]
      #
      #   @param n [Integer, nil]
      #
      #   @param output_audio_format [String, nil]
      #
      #   @param parallel_tool_calls [Boolean, nil]
      #
      #   @param prediction [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param presence_penalty [Float, nil]
      #
      #   @param prompt_cache_key [String, nil]
      #
      #   @param reasoning [DedalusSDK::Models::Reasoning, nil] **gpt-5 and o-series models only**
      #
      #   @param reasoning_effort [String, nil]
      #
      #   @param response_format [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param safety_identifier [String, nil]
      #
      #   @param safety_settings [Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil]
      #
      #   @param search_parameters [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param seed [Integer, nil]
      #
      #   @param service_tier [String, nil]
      #
      #   @param stop [String, Array<String>, nil]
      #
      #   @param store [Boolean, nil]
      #
      #   @param stream [Boolean, nil]
      #
      #   @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param structured_output [Object]
      #
      #   @param system_instruction [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param temperature [Float, nil]
      #
      #   @param thinking [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param timeout [Float, nil]
      #
      #   @param tool_choice [Symbol, String, Hash{Symbol=>Object}, DedalusSDK::Models::ToolChoice::MCPToolChoice, DedalusSDK::Models::ToolChoice, nil]
      #
      #   @param tool_config [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param top_k [Integer, nil]
      #
      #   @param top_logprobs [Integer, nil]
      #
      #   @param top_p [Float, nil]
      #
      #   @param truncation [Symbol, DedalusSDK::Models::ModelSettings::Truncation, nil]
      #
      #   @param turn_detection [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
      #
      #   @param user [String, nil]
      #
      #   @param verbosity [String, nil]
      #
      #   @param voice [String, nil]
      #
      #   @param web_search_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]

      # @see DedalusSDK::Models::ModelSettings#stop
      module Stop
        extend DedalusSDK::Internal::Type::Union

        variant String

        variant -> { DedalusSDK::Models::ModelSettings::Stop::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        # @type [DedalusSDK::Internal::Type::Converter]
        StringArray = DedalusSDK::Internal::Type::ArrayOf[String]
      end

      # @see DedalusSDK::Models::ModelSettings#truncation
      module Truncation
        extend DedalusSDK::Internal::Type::Enum

        AUTO = :auto
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
