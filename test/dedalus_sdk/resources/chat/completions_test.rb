# frozen_string_literal: true

require_relative "../../test_helper"

class DedalusSDK::Test::Resources::Chat::CompletionsTest < DedalusSDK::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.chat.completions.create(model: "openai/gpt-5")

    assert_pattern do
      response => DedalusSDK::Chat::ChatCompletion
    end

    assert_pattern do
      response => {
        id: String,
        choices: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::Choice]),
        created: Integer,
        model: String,
        object: Symbol,
        correlation_id: String | nil,
        deferred: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::DeferredCallResponse]) | nil,
        mcp_server_errors: ^(DedalusSDK::Internal::Type::HashOf[DedalusSDK::Chat::ChatCompletion::MCPServerError]) | nil,
        mcp_tool_results: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::MCPToolResult]) | nil,
        pending_tools: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletion::PendingTool]) | nil,
        server_results: ^(DedalusSDK::Internal::Type::HashOf[union: DedalusSDK::JSONValueInput,
                                                             nil?: true]) | nil,
        service_tier: DedalusSDK::Chat::ChatCompletion::ServiceTier | nil,
        system_fingerprint: String | nil,
        tools_executed: ^(DedalusSDK::Internal::Type::ArrayOf[String]) | nil,
        turns_consumed: Integer | nil,
        usage: DedalusSDK::Chat::CompletionUsage | nil
      }
    end
  end
end
