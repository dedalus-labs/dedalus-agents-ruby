# typed: strong

module DedalusSDK
  module Models
    class Reasoning < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::Reasoning, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(T.nilable(DedalusSDK::Reasoning::Effort::OrSymbol)) }
      attr_accessor :effort

      sig do
        returns(T.nilable(DedalusSDK::Reasoning::GenerateSummary::OrSymbol))
      end
      attr_accessor :generate_summary

      sig { returns(T.nilable(DedalusSDK::Reasoning::Summary::OrSymbol)) }
      attr_accessor :summary

      # **gpt-5 and o-series models only**
      #
      # Configuration options for
      # [reasoning models](https://platform.openai.com/docs/guides/reasoning).
      sig do
        params(
          effort: T.nilable(DedalusSDK::Reasoning::Effort::OrSymbol),
          generate_summary:
            T.nilable(DedalusSDK::Reasoning::GenerateSummary::OrSymbol),
          summary: T.nilable(DedalusSDK::Reasoning::Summary::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(effort: nil, generate_summary: nil, summary: nil)
      end

      sig do
        override.returns(
          {
            effort: T.nilable(DedalusSDK::Reasoning::Effort::OrSymbol),
            generate_summary:
              T.nilable(DedalusSDK::Reasoning::GenerateSummary::OrSymbol),
            summary: T.nilable(DedalusSDK::Reasoning::Summary::OrSymbol)
          }
        )
      end
      def to_hash
      end

      module Effort
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::Reasoning::Effort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NONE = T.let(:none, DedalusSDK::Reasoning::Effort::TaggedSymbol)
        MINIMAL = T.let(:minimal, DedalusSDK::Reasoning::Effort::TaggedSymbol)
        LOW = T.let(:low, DedalusSDK::Reasoning::Effort::TaggedSymbol)
        MEDIUM = T.let(:medium, DedalusSDK::Reasoning::Effort::TaggedSymbol)
        HIGH = T.let(:high, DedalusSDK::Reasoning::Effort::TaggedSymbol)
        XHIGH = T.let(:xhigh, DedalusSDK::Reasoning::Effort::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DedalusSDK::Reasoning::Effort::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module GenerateSummary
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::Reasoning::GenerateSummary) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO =
          T.let(:auto, DedalusSDK::Reasoning::GenerateSummary::TaggedSymbol)
        CONCISE =
          T.let(:concise, DedalusSDK::Reasoning::GenerateSummary::TaggedSymbol)
        DETAILED =
          T.let(:detailed, DedalusSDK::Reasoning::GenerateSummary::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DedalusSDK::Reasoning::GenerateSummary::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Summary
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::Reasoning::Summary) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, DedalusSDK::Reasoning::Summary::TaggedSymbol)
        CONCISE = T.let(:concise, DedalusSDK::Reasoning::Summary::TaggedSymbol)
        DETAILED =
          T.let(:detailed, DedalusSDK::Reasoning::Summary::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DedalusSDK::Reasoning::Summary::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
