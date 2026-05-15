# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Models
      # Retrieve a model.
      #
      # Retrieve detailed information about a specific model, including its
      # capabilities, provider, and supported features.
      #
      # Args: model_id: The ID of the model to retrieve (e.g., 'openai/gpt-4',
      # 'anthropic/claude-3-5-sonnet-20241022') user: Authenticated user obtained from
      # API key validation
      #
      # Returns: Model: Information about the requested model
      #
      # Raises: HTTPException: - 401 if authentication fails - 404 if model not found or
      # not accessible with current API key - 500 if internal error occurs
      #
      # Requires: Valid API key with 'read' scope permission
      #
      # Example: ```python import dedalus_labs
      #
      #     client = dedalus_labs.Client(api_key="your-api-key")
      #     model = client.models.retrieve("openai/gpt-4")
      #
      #     print(f"Model: {model.id}")
      #     print(f"Owner: {model.owned_by}")
      #     ```
      #
      #     Response:
      #     ```json
      #     {
      #         "id": "openai/gpt-4",
      #         "object": "model",
      #         "created": 1687882411,
      #         "owned_by": "openai"
      #     }
      #     ```
      #
      # @overload retrieve(model_id, request_options: {})
      #
      # @param model_id [String]
      # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DedalusSDK::Models::Model]
      #
      # @see DedalusSDK::Models::ModelRetrieveParams
      def retrieve(model_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/models/%1$s", model_id],
          model: DedalusSDK::Model,
          options: params[:request_options]
        )
      end

      # List available models.
      #
      # Retrieve the complete list of models available to your organization, including
      # models from OpenAI, Anthropic, Google, xAI, Mistral, Fireworks, and DeepSeek.
      #
      # Returns: ListModelsResponse: List of available models across all supported
      # providers
      #
      # @overload list(request_options: {})
      #
      # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DedalusSDK::Models::ListModelsResponse]
      #
      # @see DedalusSDK::Models::ModelListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/models",
          model: DedalusSDK::ListModelsResponse,
          options: params[:request_options]
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
