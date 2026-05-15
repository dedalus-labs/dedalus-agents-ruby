# typed: strong

module DedalusSDK
  module Resources
    class Responses
      # Create a response using the OpenAI Responses API.
      #
      # This endpoint routes directly to OpenAI's Responses API. Only OpenAI models are
      # supported.
      sig do
        params(
          background: T.nilable(T::Boolean),
          conversation:
            T.nilable(
              T.any(
                String,
                DedalusSDK::ResponseCreateParams::Conversation::ResponseConversationParam::OrHash
              )
            ),
          credentials:
            T.nilable(
              T.any(
                DedalusSDK::Credential::OrHash,
                T::Array[DedalusSDK::Credential::OrHash]
              )
            ),
          frequency_penalty: T.nilable(Float),
          include: T.nilable(T::Array[String]),
          input: T.nilable(DedalusSDK::ResponseCreateParams::Input::Variants),
          instructions:
            T.nilable(DedalusSDK::ResponseCreateParams::Instructions::Variants),
          max_output_tokens: T.nilable(Integer),
          max_tool_calls: T.nilable(Integer),
          mcp_servers:
            T.nilable(
              T.any(
                String,
                DedalusSDK::MCPServerSpec::OrHash,
                T::Array[T.any(String, DedalusSDK::MCPServerSpec::OrHash)]
              )
            ),
          metadata: T.nilable(T::Hash[Symbol, String]),
          model:
            T.nilable(
              T.any(
                String,
                DedalusSDK::DedalusModel::OrHash,
                T::Array[T.any(String, DedalusSDK::DedalusModel::OrHash)]
              )
            ),
          parallel_tool_calls: T.nilable(T::Boolean),
          presence_penalty: T.nilable(Float),
          previous_response_id: T.nilable(String),
          prompt: T.nilable(DedalusSDK::ResponseCreateParams::Prompt::OrHash),
          prompt_cache_key: T.nilable(String),
          reasoning:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          safety_identifier: T.nilable(String),
          service_tier:
            T.nilable(DedalusSDK::ResponseCreateParams::ServiceTier::OrSymbol),
          store: T.nilable(T::Boolean),
          stream: T::Boolean,
          stream_options:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          temperature: T.nilable(Float),
          text:
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            ),
          tool_choice:
            T.nilable(DedalusSDK::ResponseCreateParams::ToolChoice::Variants),
          tools:
            T.nilable(
              T::Array[
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ]
            ),
          top_logprobs: T.nilable(Integer),
          top_p: T.nilable(Float),
          truncation:
            T.nilable(DedalusSDK::ResponseCreateParams::Truncation::OrSymbol),
          user: T.nilable(String),
          request_options: DedalusSDK::RequestOptions::OrHash
        ).returns(DedalusSDK::Response)
      end
      def create(
        # Whether to run the model response in the background.
        # [Learn more](https://platform.openai.com/docs/guides/background).
        background: nil,
        # Conversation that this response belongs to. Items from this conversation are
        # prepended to the input items, and output items from this response are
        # automatically added after completion.
        conversation: nil,
        # Credentials for MCP server authentication. Each credential is matched to servers
        # by connection name.
        credentials: nil,
        # Penalizes new tokens based on their frequency in the text so far.
        frequency_penalty: nil,
        # Specify additional output data to include in the model response. Currently
        # supported values are:
        #
        # - `web_search_call.action.sources`: Include the sources of the web search tool
        #   call.
        # - `code_interpreter_call.outputs`: Includes the outputs of python code execution
        #   in code interpreter tool call items.
        # - `computer_call_output.output.image_url`: Include image urls from the computer
        #   call output.
        # - `file_search_call.results`: Include the search results of the file search tool
        #   call.
        # - `message.input_image.image_url`: Include image urls from the input message.
        # - `message.output_text.logprobs`: Include logprobs with assistant messages.
        # - `reasoning.encrypted_content`: Includes an encrypted version of reasoning
        #   tokens in reasoning item outputs. This enables reasoning items to be used in
        #   multi-turn conversations when using the Responses API statelessly (like when
        #   the `store` parameter is set to `false`, or when an organization is enrolled
        #   in the zero data retention program).
        include: nil,
        # Text, image, or file inputs to the model, used to generate a response.
        #
        # Learn more:
        #
        # - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
        # - [Image inputs](https://platform.openai.com/docs/guides/images)
        # - [File inputs](https://platform.openai.com/docs/guides/pdf-files)
        # - [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
        # - [Function calling](https://platform.openai.com/docs/guides/function-calling)
        input: nil,
        # A system (or developer) message inserted into the model's context.
        #
        # When using along with `previous_response_id`, the instructions from a previous
        # response will not be carried over to the next response. This makes it simple to
        # swap out system (or developer) messages in new responses.
        instructions: nil,
        # An upper bound for the number of tokens that can be generated for a response,
        # including visible output tokens and
        # [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
        max_output_tokens: nil,
        # The maximum number of total calls to built-in tools that can be processed in a
        # response. This maximum number applies across all built-in tool calls, not per
        # individual tool. Any further attempts to call a tool by the model will be
        # ignored.
        max_tool_calls: nil,
        # MCP server identifiers. Accepts marketplace slugs, URLs, or MCPServerSpec
        # objects. MCP tools are executed server-side and billed separately.
        mcp_servers: nil,
        # Set of up to 16 key-value string pairs that can be attached to the response for
        # structured metadata and later querying via the API or dashboard.
        metadata: nil,
        # Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI offers a
        # wide range of models with different capabilities, performance characteristics,
        # and price points. Refer to the
        # [model guide](https://platform.openai.com/docs/models) to browse and compare
        # available models.
        model: nil,
        # Whether to allow the model to run tool calls in parallel.
        parallel_tool_calls: nil,
        # Penalizes new tokens based on whether they appear in the text so far.
        presence_penalty: nil,
        # Unique ID of the previous response to continue from when creating multi-turn
        # conversations. Cannot be used together with `conversation`.
        previous_response_id: nil,
        # Stored prompt template reference (BYOK).
        prompt: nil,
        # Used by OpenAI to cache responses for similar requests to optimize your cache
        # hit rates. Replaces the `user` field.
        # [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
        prompt_cache_key: nil,
        # **gpt-5 and o-series models only**
        #
        # Configuration options for
        # [reasoning models](https://platform.openai.com/docs/guides/reasoning).
        reasoning: nil,
        # A stable identifier used to help detect users of your application that may be
        # violating OpenAI's usage policies. The IDs should be a string that uniquely
        # identifies each user. We recommend hashing their username or email address, in
        # order to avoid sending us any identifying information.
        # [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
        safety_identifier: nil,
        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](https://platform.openai.com/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        service_tier: nil,
        # Whether to store the generated response for later retrieval via the Responses
        # API.
        store: nil,
        # If set to true, the model response data will be streamed to the client as it is
        # generated using
        # [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
        # See the
        # [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
        # for more information.
        stream: nil,
        # Options for streaming response. Only set this when you set `stream: true`.
        stream_options: nil,
        # What sampling temperature to use, between 0 and 2. Higher values like 0.8 will
        # make the output more random, while lower values like 0.2 will make it more
        # focused and deterministic. We generally recommend altering this or `top_p` but
        # not both.
        temperature: nil,
        # Configuration options for a text response from the model. Can be plain text or
        # structured JSON data. Learn more:
        #
        # - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
        # - [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
        text: nil,
        # How the model should select which tool (or tools) to use when generating a
        # response. See the `tools` parameter to see how to specify which tools the model
        # can call.
        tool_choice: nil,
        # An array of tools the model may call while generating a response. You can
        # specify which tool to use by setting the `tool_choice` parameter.
        #
        # We support the following categories of tools:
        #
        # - **Built-in tools**: Tools that are provided by OpenAI that extend the model's
        #   capabilities, like
        #   [web search](https://platform.openai.com/docs/guides/tools-web-search) or
        #   [file search](https://platform.openai.com/docs/guides/tools-file-search).
        #   Learn more about
        #   [built-in tools](https://platform.openai.com/docs/guides/tools).
        # - **MCP Tools**: Integrations with third-party systems via custom MCP servers or
        #   predefined connectors such as Google Drive and SharePoint. Learn more about
        #   [MCP Tools](https://platform.openai.com/docs/guides/tools-connectors-mcp).
        # - **Function calls (custom tools)**: Functions that are defined by you, enabling
        #   the model to call your own code with strongly typed arguments and outputs.
        #   Learn more about
        #   [function calling](https://platform.openai.com/docs/guides/function-calling).
        #   You can also use custom tools to call your own code.
        tools: nil,
        # An integer between 0 and 20 specifying the number of most likely tokens to
        # return at each token position, each with an associated log probability.
        top_logprobs: nil,
        # An alternative to sampling with temperature, called nucleus sampling, where the
        # model considers the results of the tokens with top_p probability mass. So 0.1
        # means only the tokens comprising the top 10% probability mass are considered.
        #
        # We generally recommend altering this or `temperature` but not both.
        top_p: nil,
        # The truncation strategy to use for the model response.
        #
        # - `auto`: If the input to this Response exceeds the model's context window size,
        #   the model will truncate the response to fit the context window by dropping
        #   items from the beginning of the conversation.
        # - `disabled` (default): If the input size will exceed the context window size
        #   for a model, the request will fail with a 400 error.
        truncation: nil,
        # This field is being replaced by `safety_identifier` and `prompt_cache_key`. Use
        # `prompt_cache_key` instead to maintain caching optimizations. A stable
        # identifier for your end-users. Used to boost cache hit rates by better bucketing
        # similar requests and to help OpenAI detect and prevent abuse.
        # [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
        user: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DedalusSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
