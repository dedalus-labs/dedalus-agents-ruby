# frozen_string_literal: true

require_relative "../test_helper"

class DedalusSDK::Test::Resources::ResponsesTest < DedalusSDK::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @dedalus.responses.create

    assert_pattern do
      response => DedalusSDK::Response
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Float,
        model: String,
        output: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                                                         nil?: true]]),
        status: DedalusSDK::Response::Status,
        background: DedalusSDK::Internal::Type::Boolean | nil,
        completed_at: Float | nil,
        conversation: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                           nil?: true]) | nil,
        error: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]) | nil,
        frequency_penalty: Float | nil,
        incomplete_details: ^(DedalusSDK::Internal::Type::HashOf[String]) | nil,
        instructions: DedalusSDK::Response::Instructions | nil,
        max_output_tokens: Integer | nil,
        max_tool_calls: Integer | nil,
        mcp_server_errors: ^(DedalusSDK::Internal::Type::HashOf[DedalusSDK::Response::MCPServerError]) | nil,
        mcp_tool_results: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::MCPToolResult]) | nil,
        metadata: ^(DedalusSDK::Internal::Type::HashOf[String]) | nil,
        object: DedalusSDK::Response::Object | nil,
        output_text: String | nil,
        parallel_tool_calls: DedalusSDK::Internal::Type::Boolean | nil,
        presence_penalty: Float | nil,
        previous_response_id: String | nil,
        prompt_cache_key: String | nil,
        reasoning: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]) | nil,
        safety_identifier: String | nil,
        service_tier: String | nil,
        store: DedalusSDK::Internal::Type::Boolean | nil,
        temperature: Float | nil,
        text: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]) | nil,
        tool_choice: DedalusSDK::Response::ToolChoice | nil,
        tools: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                                                        nil?: true]]) | nil,
        tools_executed: ^(DedalusSDK::Internal::Type::ArrayOf[String]) | nil,
        top_logprobs: Integer | nil,
        top_p: Float | nil,
        truncation: String | nil,
        usage: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput, nil?: true]) | nil
      }
    end
  end
end
