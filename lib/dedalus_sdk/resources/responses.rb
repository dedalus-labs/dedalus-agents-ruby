# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Responses
      # Some parameter documentations has been truncated, see
      # {DedalusSDK::Models::ResponseCreateParams} for more details.
      #
      # Create a response using the OpenAI Responses API.
      #
      # This endpoint routes directly to OpenAI's Responses API. Only OpenAI models are
      # supported.
      #
      # @overload create(background: nil, conversation: nil, credentials: nil, frequency_penalty: nil, include: nil, input: nil, instructions: nil, max_output_tokens: nil, max_tool_calls: nil, mcp_servers: nil, metadata: nil, model: nil, parallel_tool_calls: nil, presence_penalty: nil, previous_response_id: nil, prompt: nil, prompt_cache_key: nil, reasoning: nil, safety_identifier: nil, service_tier: nil, store: nil, stream: nil, stream_options: nil, temperature: nil, text: nil, tool_choice: nil, tools: nil, top_logprobs: nil, top_p: nil, truncation: nil, user: nil, request_options: {})
      #
      # @param background [Boolean, nil] Whether to run the model response in the background.
      #
      # @param conversation [String, DedalusSDK::Models::ResponseCreateParams::Conversation::ResponseConversationParam, nil] Conversation that this response belongs to. Items from this conversation are pre
      #
      # @param credentials [DedalusSDK::Models::Credential, Array<DedalusSDK::Models::Credential>, nil] Credentials for MCP server authentication. Each credential is matched to servers
      #
      # @param frequency_penalty [Float, nil] Penalizes new tokens based on their frequency in the text so far.
      #
      # @param include [Array<String>, nil] Specify additional output data to include in the model response. Currently
      #
      # @param input [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] Text, image, or file inputs to the model, used to generate a response.
      #
      # @param instructions [String, Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] A system (or developer) message inserted into the model's context.
      #
      # @param max_output_tokens [Integer, nil] An upper bound for the number of tokens that can be generated for a response, in
      #
      # @param max_tool_calls [Integer, nil] The maximum number of total calls to built-in tools that can be processed in a r
      #
      # @param mcp_servers [String, DedalusSDK::Models::MCPServerSpec, Array<String, DedalusSDK::Models::MCPServerSpec>, nil] MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec object
      #
      # @param metadata [Hash{Symbol=>String}, nil] Set of up to 16 key-value string pairs that can be attached to the response for
      #
      # @param model [String, DedalusSDK::Models::DedalusModel, Array<String, DedalusSDK::Models::DedalusModel>, nil] Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
      #
      # @param parallel_tool_calls [Boolean, nil] Whether to allow the model to run tool calls in parallel.
      #
      # @param presence_penalty [Float, nil] Penalizes new tokens based on whether they appear in the text so far.
      #
      # @param previous_response_id [String, nil] Unique ID of the previous response to continue from when creating multi-turn con
      #
      # @param prompt [DedalusSDK::Models::ResponseCreateParams::Prompt, nil] Stored prompt template reference (BYOK).
      #
      # @param prompt_cache_key [String, nil] Used by OpenAI to cache responses for similar requests to optimize your cache hi
      #
      # @param reasoning [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] **gpt-5 and o-series models only**
      #
      # @param safety_identifier [String, nil] A stable identifier used to help detect users of your application that may be vi
      #
      # @param service_tier [Symbol, DedalusSDK::Models::ResponseCreateParams::ServiceTier, nil] Specifies the processing type used for serving the request.
      #
      # @param store [Boolean, nil] Whether to store the generated response for later retrieval via the Responses AP
      #
      # @param stream [Boolean] If set to true, the model response data will be streamed to the client
      #
      # @param stream_options [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Options for streaming response. Only set this when you set `stream: true`.
      #
      # @param temperature [Float, nil] What sampling temperature to use, between 0 and 2. Higher values like 0.8 will m
      #
      # @param text [Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] Configuration options for a text response from the model. Can be plain
      #
      # @param tool_choice [String, Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}, nil] How the model should select which tool (or tools) to use when generating
      #
      # @param tools [Array<Hash{Symbol=>String, Float, Boolean, Hash{Symbol=>DedalusSDK::Models::JSONValueInput, nil}, Array<DedalusSDK::Models::JSONValueInput, nil>, nil}>, nil] An array of tools the model may call while generating a response. You
      #
      # @param top_logprobs [Integer, nil] An integer between 0 and 20 specifying the number of most likely tokens to
      #
      # @param top_p [Float, nil] An alternative to sampling with temperature, called nucleus sampling,
      #
      # @param truncation [Symbol, DedalusSDK::Models::ResponseCreateParams::Truncation, nil] The truncation strategy to use for the model response.
      #
      # @param user [String, nil] This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
      #
      # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DedalusSDK::Models::Response]
      #
      # @see DedalusSDK::Models::ResponseCreateParams
      def create(params = {})
        parsed, options = DedalusSDK::ResponseCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/responses",
          body: parsed,
          model: DedalusSDK::Response,
          options: options
        )
      end

      # @api private
      #
      # @param client [DedalusSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
