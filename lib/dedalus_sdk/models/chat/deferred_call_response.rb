# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class DeferredCallResponse < DedalusSDK::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this deferred call.
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #   Name of the tool.
        #
        #   @return [String]
        required :name, String

        # @!attribute arguments
        #   Input arguments for the tool call.
        #
        #   @return [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil]
        optional :arguments,
                 -> { DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true] }

        # @!attribute blocked_by
        #   IDs of pending client calls blocking this call.
        #
        #   @return [Array<String>, nil]
        optional :blocked_by, DedalusSDK::Internal::Type::ArrayOf[String]

        # @!attribute dependencies
        #   IDs of calls this depends on.
        #
        #   @return [Array<String>, nil]
        optional :dependencies, DedalusSDK::Internal::Type::ArrayOf[String]

        # @!attribute venue
        #   Execution venue (server or client).
        #
        #   @return [String, nil]
        optional :venue, String

        # @!method initialize(id:, name:, arguments: nil, blocked_by: nil, dependencies: nil, venue: nil)
        #   Server-side call blocked until pending client calls complete.
        #
        #   Carries full spec for stateless resumption on subsequent turns.
        #
        #   @param id [String] Unique identifier for this deferred call.
        #
        #   @param name [String] Name of the tool.
        #
        #   @param arguments [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}] Input arguments for the tool call.
        #
        #   @param blocked_by [Array<String>] IDs of pending client calls blocking this call.
        #
        #   @param dependencies [Array<String>] IDs of calls this depends on.
        #
        #   @param venue [String] Execution venue (server or client).
      end
    end
  end
end
