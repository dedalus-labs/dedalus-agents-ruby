# frozen_string_literal: true

module DedalusSDK
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |event|
    #     puts(event)
    #   end
    class Stream
      include DedalusSDK::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        # rubocop:disable Metrics/BlockLength
        @iterator ||= DedalusSDK::Internal::Util.chain_fused(@stream) do |y|
          consume = false

          @stream.each do |msg|
            next if consume

            case msg
            in {data: String => data} if data.start_with?("[DONE]")
              consume = true
              next
            in {event: "error", data: String => data}
              decoded = Kernel.then do
                JSON.parse(data, symbolize_names: true)
              rescue JSON::ParserError
                data
              end
              err = DedalusSDK::Errors::APIStatusError.for(
                url: @url,
                status: @status,
                headers: @headers,
                body: decoded,
                request: nil,
                response: @response
              )
              raise err
            in {event: nil, data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = DedalusSDK::Internal::Util.dig(decoded, @unwrap)
              y << DedalusSDK::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
        # rubocop:enable Metrics/BlockLength
      end
    end
  end
end
