# typed: strong

module DedalusSDK
  module Models
    ChatCompletionToolParam = Chat::ChatCompletionToolParam

    module Chat
      class ChatCompletionToolParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionToolParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Schema for Function.
        #
        # Fields:
        #
        # - name (required): str
        sig { returns(DedalusSDK::FunctionDefinition) }
        attr_reader :function

        sig { params(function: DedalusSDK::FunctionDefinition::OrHash).void }
        attr_writer :function

        sig do
          returns(
            T.nilable(DedalusSDK::Chat::ChatCompletionToolParam::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: DedalusSDK::Chat::ChatCompletionToolParam::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Schema for Tool.
        #
        # Fields:
        #
        # - type (optional): ToolTypes
        # - function (required): Function
        sig do
          params(
            function: DedalusSDK::FunctionDefinition::OrHash,
            type: DedalusSDK::Chat::ChatCompletionToolParam::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for Function.
          #
          # Fields:
          #
          # - name (required): str
          function:,
          type: nil
        )
        end

        sig do
          override.returns(
            {
              function: DedalusSDK::FunctionDefinition,
              type: DedalusSDK::Chat::ChatCompletionToolParam::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletionToolParam::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FUNCTION =
            T.let(
              :function,
              DedalusSDK::Chat::ChatCompletionToolParam::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionToolParam::Type::TaggedSymbol
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
