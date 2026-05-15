# typed: strong

module DedalusSDK
  module Models
    module Chat
      class ThinkingConfigDisabled < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ThinkingConfigDisabled,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Schema for ThinkingConfigDisabled.
        #
        # Fields:
        #
        # - type (required): Literal["disabled"]
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :disabled)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
