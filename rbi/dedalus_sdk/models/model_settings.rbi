# typed: strong

module DedalusSDK
  module Models
    class ModelSettings < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ModelSettings, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :attributes

      sig { params(attributes: T::Hash[Symbol, T.anything]).void }
      attr_writer :attributes

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :audio

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :deferred

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :extra_args

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :extra_headers

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :extra_query

      sig { returns(T.nilable(Float)) }
      attr_accessor :frequency_penalty

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :generation_config

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :include_usage

      sig { returns(T.nilable(String)) }
      attr_accessor :input_audio_format

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :input_audio_transcription

      sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
      attr_accessor :logit_bias

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :logprobs

      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_completion_tokens

      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_tokens

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :metadata

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :modalities

      sig { returns(T.nilable(Integer)) }
      attr_accessor :n

      sig { returns(T.nilable(String)) }
      attr_accessor :output_audio_format

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :parallel_tool_calls

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :prediction

      sig { returns(T.nilable(Float)) }
      attr_accessor :presence_penalty

      sig { returns(T.nilable(String)) }
      attr_accessor :prompt_cache_key

      # **gpt-5 and o-series models only**
      #
      # Configuration options for
      # [reasoning models](https://platform.openai.com/docs/guides/reasoning).
      sig { returns(T.nilable(DedalusSDK::Reasoning)) }
      attr_reader :reasoning

      sig { params(reasoning: T.nilable(DedalusSDK::Reasoning::OrHash)).void }
      attr_writer :reasoning

      sig { returns(T.nilable(String)) }
      attr_accessor :reasoning_effort

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :response_format

      sig { returns(T.nilable(String)) }
      attr_accessor :safety_identifier

      sig do
        returns(
          T.nilable(
            T::Array[
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ]
          )
        )
      end
      attr_accessor :safety_settings

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :search_parameters

      sig { returns(T.nilable(Integer)) }
      attr_accessor :seed

      sig { returns(T.nilable(String)) }
      attr_accessor :service_tier

      sig { returns(T.nilable(DedalusSDK::ModelSettings::Stop::Variants)) }
      attr_accessor :stop

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :store

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :stream

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :stream_options

      sig { returns(T.nilable(T.anything)) }
      attr_reader :structured_output

      sig { params(structured_output: T.anything).void }
      attr_writer :structured_output

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :system_instruction

      sig { returns(T.nilable(Float)) }
      attr_accessor :temperature

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :thinking

      sig { returns(T.nilable(Float)) }
      attr_accessor :timeout

      sig do
        returns(
          T.nilable(
            T.any(
              DedalusSDK::ToolChoice::OrSymbol,
              String,
              T::Hash[Symbol, T.anything],
              DedalusSDK::ToolChoice::MCPToolChoice
            )
          )
        )
      end
      attr_accessor :tool_choice

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :tool_config

      sig { returns(T.nilable(Integer)) }
      attr_accessor :top_k

      sig { returns(T.nilable(Integer)) }
      attr_accessor :top_logprobs

      sig { returns(T.nilable(Float)) }
      attr_accessor :top_p

      sig do
        returns(T.nilable(DedalusSDK::ModelSettings::Truncation::OrSymbol))
      end
      attr_accessor :truncation

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :turn_detection

      sig { returns(T.nilable(String)) }
      attr_accessor :user

      sig { returns(T.nilable(String)) }
      attr_accessor :verbosity

      sig { returns(T.nilable(String)) }
      attr_accessor :voice

      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          )
        )
      end
      attr_accessor :web_search_options

      sig do
        params(
          attributes: T::Hash[Symbol, T.anything],
          audio:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          deferred: T.nilable(T::Boolean),
          extra_args: T.nilable(T::Hash[Symbol, T.anything]),
          extra_headers: T.nilable(T::Hash[Symbol, String]),
          extra_query: T.nilable(T::Hash[Symbol, T.anything]),
          frequency_penalty: T.nilable(Float),
          generation_config:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          include_usage: T.nilable(T::Boolean),
          input_audio_format: T.nilable(String),
          input_audio_transcription:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          logit_bias: T.nilable(T::Hash[Symbol, Integer]),
          logprobs: T.nilable(T::Boolean),
          max_completion_tokens: T.nilable(Integer),
          max_tokens: T.nilable(Integer),
          metadata: T.nilable(T::Hash[Symbol, String]),
          modalities: T.nilable(T::Array[String]),
          n: T.nilable(Integer),
          output_audio_format: T.nilable(String),
          parallel_tool_calls: T.nilable(T::Boolean),
          prediction:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          presence_penalty: T.nilable(Float),
          prompt_cache_key: T.nilable(String),
          reasoning: T.nilable(DedalusSDK::Reasoning::OrHash),
          reasoning_effort: T.nilable(String),
          response_format:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          safety_identifier: T.nilable(String),
          safety_settings:
            T.nilable(
              T::Array[
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ]
            ),
          search_parameters:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          seed: T.nilable(Integer),
          service_tier: T.nilable(String),
          stop: T.nilable(DedalusSDK::ModelSettings::Stop::Variants),
          store: T.nilable(T::Boolean),
          stream: T.nilable(T::Boolean),
          stream_options:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          structured_output: T.anything,
          system_instruction:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          temperature: T.nilable(Float),
          thinking:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          timeout: T.nilable(Float),
          tool_choice:
            T.nilable(
              T.any(
                DedalusSDK::ToolChoice::OrSymbol,
                String,
                T::Hash[Symbol, T.anything],
                DedalusSDK::ToolChoice::MCPToolChoice::OrHash
              )
            ),
          tool_config:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          top_k: T.nilable(Integer),
          top_logprobs: T.nilable(Integer),
          top_p: T.nilable(Float),
          truncation:
            T.nilable(DedalusSDK::ModelSettings::Truncation::OrSymbol),
          turn_detection:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          user: T.nilable(String),
          verbosity: T.nilable(String),
          voice: T.nilable(String),
          web_search_options:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
        ).returns(T.attached_class)
      end
      def self.new(
        attributes: nil,
        audio: nil,
        deferred: nil,
        extra_args: nil,
        extra_headers: nil,
        extra_query: nil,
        frequency_penalty: nil,
        generation_config: nil,
        include_usage: nil,
        input_audio_format: nil,
        input_audio_transcription: nil,
        logit_bias: nil,
        logprobs: nil,
        max_completion_tokens: nil,
        max_tokens: nil,
        metadata: nil,
        modalities: nil,
        n: nil,
        output_audio_format: nil,
        parallel_tool_calls: nil,
        prediction: nil,
        presence_penalty: nil,
        prompt_cache_key: nil,
        # **gpt-5 and o-series models only**
        #
        # Configuration options for
        # [reasoning models](https://platform.openai.com/docs/guides/reasoning).
        reasoning: nil,
        reasoning_effort: nil,
        response_format: nil,
        safety_identifier: nil,
        safety_settings: nil,
        search_parameters: nil,
        seed: nil,
        service_tier: nil,
        stop: nil,
        store: nil,
        stream: nil,
        stream_options: nil,
        structured_output: nil,
        system_instruction: nil,
        temperature: nil,
        thinking: nil,
        timeout: nil,
        tool_choice: nil,
        tool_config: nil,
        top_k: nil,
        top_logprobs: nil,
        top_p: nil,
        truncation: nil,
        turn_detection: nil,
        user: nil,
        verbosity: nil,
        voice: nil,
        web_search_options: nil
      )
      end

      sig do
        override.returns(
          {
            attributes: T::Hash[Symbol, T.anything],
            audio:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            deferred: T.nilable(T::Boolean),
            extra_args: T.nilable(T::Hash[Symbol, T.anything]),
            extra_headers: T.nilable(T::Hash[Symbol, String]),
            extra_query: T.nilable(T::Hash[Symbol, T.anything]),
            frequency_penalty: T.nilable(Float),
            generation_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            include_usage: T.nilable(T::Boolean),
            input_audio_format: T.nilable(String),
            input_audio_transcription:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            logit_bias: T.nilable(T::Hash[Symbol, Integer]),
            logprobs: T.nilable(T::Boolean),
            max_completion_tokens: T.nilable(Integer),
            max_tokens: T.nilable(Integer),
            metadata: T.nilable(T::Hash[Symbol, String]),
            modalities: T.nilable(T::Array[String]),
            n: T.nilable(Integer),
            output_audio_format: T.nilable(String),
            parallel_tool_calls: T.nilable(T::Boolean),
            prediction:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            presence_penalty: T.nilable(Float),
            prompt_cache_key: T.nilable(String),
            reasoning: T.nilable(DedalusSDK::Reasoning),
            reasoning_effort: T.nilable(String),
            response_format:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            safety_identifier: T.nilable(String),
            safety_settings:
              T.nilable(
                T::Array[
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ]
              ),
            search_parameters:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            seed: T.nilable(Integer),
            service_tier: T.nilable(String),
            stop: T.nilable(DedalusSDK::ModelSettings::Stop::Variants),
            store: T.nilable(T::Boolean),
            stream: T.nilable(T::Boolean),
            stream_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            structured_output: T.anything,
            system_instruction:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            temperature: T.nilable(Float),
            thinking:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            timeout: T.nilable(Float),
            tool_choice:
              T.nilable(
                T.any(
                  DedalusSDK::ToolChoice::OrSymbol,
                  String,
                  T::Hash[Symbol, T.anything],
                  DedalusSDK::ToolChoice::MCPToolChoice
                )
              ),
            tool_config:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            top_k: T.nilable(Integer),
            top_logprobs: T.nilable(Integer),
            top_p: T.nilable(Float),
            truncation:
              T.nilable(DedalusSDK::ModelSettings::Truncation::OrSymbol),
            turn_detection:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            user: T.nilable(String),
            verbosity: T.nilable(String),
            voice: T.nilable(String),
            web_search_options:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              )
          }
        )
      end
      def to_hash
      end

      module Stop
        extend DedalusSDK::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(T::Array[DedalusSDK::ModelSettings::Stop::Variants])
        end
        def self.variants
        end

        StringArray =
          T.let(
            DedalusSDK::Internal::Type::ArrayOf[String],
            DedalusSDK::Internal::Type::Converter
          )
      end

      module Truncation
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::ModelSettings::Truncation) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, DedalusSDK::ModelSettings::Truncation::TaggedSymbol)
        DISABLED =
          T.let(:disabled, DedalusSDK::ModelSettings::Truncation::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DedalusSDK::ModelSettings::Truncation::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
