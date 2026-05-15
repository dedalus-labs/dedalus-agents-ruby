# typed: strong

module DedalusSDK
  module Models
    module ToolChoice
      extend DedalusSDK::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            DedalusSDK::ToolChoice::TaggedSymbol,
            String,
            T::Hash[Symbol, T.anything],
            DedalusSDK::ToolChoice::MCPToolChoice
          )
        end

      class MCPToolChoice < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::ToolChoice::MCPToolChoice,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :server_label

        sig do
          params(name: String, server_label: String).returns(T.attached_class)
        end
        def self.new(name:, server_label:)
        end

        sig { override.returns({ name: String, server_label: String }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[DedalusSDK::ToolChoice::Variants]) }
      def self.variants
      end

      TaggedSymbol = T.type_alias { T.all(Symbol, DedalusSDK::ToolChoice) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      AUTO = T.let(:auto, DedalusSDK::ToolChoice::TaggedSymbol)
      REQUIRED = T.let(:required, DedalusSDK::ToolChoice::TaggedSymbol)
      NONE = T.let(:none, DedalusSDK::ToolChoice::TaggedSymbol)

      UnionMember2Map =
        T.let(
          DedalusSDK::Internal::Type::HashOf[
            DedalusSDK::Internal::Type::Unknown
          ],
          DedalusSDK::Internal::Type::Converter
        )
    end
  end
end
