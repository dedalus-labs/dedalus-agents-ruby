# typed: strong

module DedalusSDK
  module Internal
    class Stream
      Message =
        type_member(:in) do
          { fixed: DedalusSDK::Internal::Util::ServerSentEvent }
        end
      Elem = type_member(:out)

      include DedalusSDK::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
