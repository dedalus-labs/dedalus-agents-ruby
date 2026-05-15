# frozen_string_literal: true

module DedalusSDK
  module Models
    class Reasoning < DedalusSDK::Internal::Type::BaseModel
      # @!attribute effort
      #
      #   @return [Symbol, DedalusSDK::Models::Reasoning::Effort, nil]
      optional :effort, enum: -> { DedalusSDK::Reasoning::Effort }, nil?: true

      # @!attribute generate_summary
      #
      #   @return [Symbol, DedalusSDK::Models::Reasoning::GenerateSummary, nil]
      optional :generate_summary, enum: -> { DedalusSDK::Reasoning::GenerateSummary }, nil?: true

      # @!attribute summary
      #
      #   @return [Symbol, DedalusSDK::Models::Reasoning::Summary, nil]
      optional :summary, enum: -> { DedalusSDK::Reasoning::Summary }, nil?: true

      # @!method initialize(effort: nil, generate_summary: nil, summary: nil)
      #   **gpt-5 and o-series models only**
      #
      #   Configuration options for
      #   [reasoning models](https://platform.openai.com/docs/guides/reasoning).
      #
      #   @param effort [Symbol, DedalusSDK::Models::Reasoning::Effort, nil]
      #   @param generate_summary [Symbol, DedalusSDK::Models::Reasoning::GenerateSummary, nil]
      #   @param summary [Symbol, DedalusSDK::Models::Reasoning::Summary, nil]

      # @see DedalusSDK::Models::Reasoning#effort
      module Effort
        extend DedalusSDK::Internal::Type::Enum

        NONE = :none
        MINIMAL = :minimal
        LOW = :low
        MEDIUM = :medium
        HIGH = :high
        XHIGH = :xhigh

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DedalusSDK::Models::Reasoning#generate_summary
      module GenerateSummary
        extend DedalusSDK::Internal::Type::Enum

        AUTO = :auto
        CONCISE = :concise
        DETAILED = :detailed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DedalusSDK::Models::Reasoning#summary
      module Summary
        extend DedalusSDK::Internal::Type::Enum

        AUTO = :auto
        CONCISE = :concise
        DETAILED = :detailed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
