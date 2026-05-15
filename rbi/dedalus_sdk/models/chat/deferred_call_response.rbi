# typed: strong

module DedalusSDK
  module Models
    module Chat
      class DeferredCallResponse < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::DeferredCallResponse,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Unique identifier for this deferred call.
        sig { returns(String) }
        attr_accessor :id

        # Name of the tool.
        sig { returns(String) }
        attr_accessor :name

        # Input arguments for the tool call.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_reader :arguments

        sig do
          params(
            arguments:
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
          ).void
        end
        attr_writer :arguments

        # IDs of pending client calls blocking this call.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :blocked_by

        sig { params(blocked_by: T::Array[String]).void }
        attr_writer :blocked_by

        # IDs of calls this depends on.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :dependencies

        sig { params(dependencies: T::Array[String]).void }
        attr_writer :dependencies

        # Execution venue (server or client).
        sig { returns(T.nilable(String)) }
        attr_reader :venue

        sig { params(venue: String).void }
        attr_writer :venue

        # Server-side call blocked until pending client calls complete.
        #
        # Carries full spec for stateless resumption on subsequent turns.
        sig do
          params(
            id: String,
            name: String,
            arguments:
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)],
            blocked_by: T::Array[String],
            dependencies: T::Array[String],
            venue: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this deferred call.
          id:,
          # Name of the tool.
          name:,
          # Input arguments for the tool call.
          arguments: nil,
          # IDs of pending client calls blocking this call.
          blocked_by: nil,
          # IDs of calls this depends on.
          dependencies: nil,
          # Execution venue (server or client).
          venue: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              name: String,
              arguments:
                T::Hash[
                  Symbol,
                  T.nilable(DedalusSDK::JSONValueInput::Variants)
                ],
              blocked_by: T::Array[String],
              dependencies: T::Array[String],
              venue: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
