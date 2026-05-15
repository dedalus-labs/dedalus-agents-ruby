# typed: strong

module DedalusSDK
  module Models
    module Chat
      class ToolChoiceNone < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ToolChoiceNone,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The model will not be allowed to use tools.
        #
        # Fields:
        #
        # - type (required): Literal["none"]
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :none)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
