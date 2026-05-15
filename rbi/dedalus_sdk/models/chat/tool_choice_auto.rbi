# typed: strong

module DedalusSDK
  module Models
    module Chat
      class ToolChoiceAuto < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ToolChoiceAuto,
              DedalusSDK::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output at most one tool
        # use.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :disable_parallel_tool_use

        sig { params(disable_parallel_tool_use: T::Boolean).void }
        attr_writer :disable_parallel_tool_use

        # The model will automatically decide whether to use tools.
        #
        # Fields:
        #
        # - disable_parallel_tool_use (optional): bool
        # - type (required): Literal["auto"]
        sig do
          params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Whether to disable parallel tool use.
          #
          # Defaults to `false`. If set to `true`, the model will output at most one tool
          # use.
          disable_parallel_tool_use: nil,
          type: :auto
        )
        end

        sig do
          override.returns(
            { type: Symbol, disable_parallel_tool_use: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
