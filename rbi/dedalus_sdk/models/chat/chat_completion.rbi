# typed: strong

module DedalusSDK
  module Models
    ChatCompletion = Chat::ChatCompletion

    module Chat
      class ChatCompletion < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletion,
              DedalusSDK::Internal::AnyHash
            )
          end

        # A unique identifier for the chat completion.
        sig { returns(String) }
        attr_accessor :id

        # A list of chat completion choices. Can be more than one if `n` is greater
        # than 1.
        sig { returns(T::Array[DedalusSDK::Chat::Choice]) }
        attr_accessor :choices

        # The Unix timestamp (in seconds) of when the chat completion was created.
        sig { returns(Integer) }
        attr_accessor :created

        # The model used for the chat completion.
        sig { returns(String) }
        attr_accessor :model

        # The object type, which is always `chat.completion`.
        sig { returns(Symbol) }
        attr_accessor :object

        # Stable session ID for cross-turn handoff state. Echo this on the next request to
        # resume server-side execution.
        sig { returns(T.nilable(String)) }
        attr_accessor :correlation_id

        # Server tools blocked on client results.
        sig do
          returns(T.nilable(T::Array[DedalusSDK::Chat::DeferredCallResponse]))
        end
        attr_accessor :deferred

        # MCP server failures keyed by server name.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, DedalusSDK::Chat::ChatCompletion::MCPServerError]
            )
          )
        end
        attr_accessor :mcp_server_errors

        # Detailed results of MCP tool executions including inputs, outputs, and timing.
        # Provides full visibility into server-side tool execution for debugging and audit
        # purposes.
        sig { returns(T.nilable(T::Array[DedalusSDK::MCPToolResult])) }
        attr_accessor :mcp_tool_results

        # Client tools to execute, with dependency ordering.
        sig do
          returns(
            T.nilable(T::Array[DedalusSDK::Chat::ChatCompletion::PendingTool])
          )
        end
        attr_accessor :pending_tools

        # Completed server tool outputs keyed by call ID.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          )
        end
        attr_accessor :server_results

        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )
          )
        end
        attr_accessor :service_tier

        # This fingerprint represents the backend configuration that the model runs with.
        #
        # Can be used in conjunction with the `seed` request parameter to understand when
        # backend changes have been made that might impact determinism.
        sig { returns(T.nilable(String)) }
        attr_reader :system_fingerprint

        sig { params(system_fingerprint: String).void }
        attr_writer :system_fingerprint

        # List of tool names that were executed server-side (e.g., MCP tools). Only
        # present when tools were executed on the server rather than returned for
        # client-side execution.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :tools_executed

        # Number of internal LLM calls made during this request. SDKs can sum this across
        # their outer loop to track total LLM calls.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :turns_consumed

        # Usage statistics for the completion request.
        sig { returns(T.nilable(DedalusSDK::Chat::CompletionUsage)) }
        attr_reader :usage

        sig { params(usage: DedalusSDK::Chat::CompletionUsage::OrHash).void }
        attr_writer :usage

        # Chat completion response for Dedalus API.
        #
        # OpenAI-compatible chat completion response with Dedalus extensions. Maintains
        # full compatibility with OpenAI API while providing additional features like
        # server-side tool execution tracking and MCP error reporting.
        sig do
          params(
            id: String,
            choices: T::Array[DedalusSDK::Chat::Choice::OrHash],
            created: Integer,
            model: String,
            correlation_id: T.nilable(String),
            deferred:
              T.nilable(
                T::Array[DedalusSDK::Chat::DeferredCallResponse::OrHash]
              ),
            mcp_server_errors:
              T.nilable(
                T::Hash[
                  Symbol,
                  DedalusSDK::Chat::ChatCompletion::MCPServerError::OrHash
                ]
              ),
            mcp_tool_results:
              T.nilable(T::Array[DedalusSDK::MCPToolResult::OrHash]),
            pending_tools:
              T.nilable(
                T::Array[DedalusSDK::Chat::ChatCompletion::PendingTool::OrHash]
              ),
            server_results:
              T.nilable(
                T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
              ),
            service_tier:
              T.nilable(
                DedalusSDK::Chat::ChatCompletion::ServiceTier::OrSymbol
              ),
            system_fingerprint: String,
            tools_executed: T.nilable(T::Array[String]),
            turns_consumed: T.nilable(Integer),
            usage: DedalusSDK::Chat::CompletionUsage::OrHash,
            object: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier for the chat completion.
          id:,
          # A list of chat completion choices. Can be more than one if `n` is greater
          # than 1.
          choices:,
          # The Unix timestamp (in seconds) of when the chat completion was created.
          created:,
          # The model used for the chat completion.
          model:,
          # Stable session ID for cross-turn handoff state. Echo this on the next request to
          # resume server-side execution.
          correlation_id: nil,
          # Server tools blocked on client results.
          deferred: nil,
          # MCP server failures keyed by server name.
          mcp_server_errors: nil,
          # Detailed results of MCP tool executions including inputs, outputs, and timing.
          # Provides full visibility into server-side tool execution for debugging and audit
          # purposes.
          mcp_tool_results: nil,
          # Client tools to execute, with dependency ordering.
          pending_tools: nil,
          # Completed server tool outputs keyed by call ID.
          server_results: nil,
          # Specifies the processing type used for serving the request.
          #
          # - If set to 'auto', then the request will be processed with the service tier
          #   configured in the Project settings. Unless otherwise configured, the Project
          #   will use 'default'.
          # - If set to 'default', then the request will be processed with the standard
          #   pricing and performance for the selected model.
          # - If set to '[flex](/docs/guides/flex-processing)' or
          #   '[priority](https://openai.com/api-priority-processing/)', then the request
          #   will be processed with the corresponding service tier.
          # - When not set, the default behavior is 'auto'.
          #
          # When the `service_tier` parameter is set, the response body will include the
          # `service_tier` value based on the processing mode actually used to serve the
          # request. This response value may be different from the value set in the
          # parameter.
          service_tier: nil,
          # This fingerprint represents the backend configuration that the model runs with.
          #
          # Can be used in conjunction with the `seed` request parameter to understand when
          # backend changes have been made that might impact determinism.
          system_fingerprint: nil,
          # List of tool names that were executed server-side (e.g., MCP tools). Only
          # present when tools were executed on the server rather than returned for
          # client-side execution.
          tools_executed: nil,
          # Number of internal LLM calls made during this request. SDKs can sum this across
          # their outer loop to track total LLM calls.
          turns_consumed: nil,
          # Usage statistics for the completion request.
          usage: nil,
          # The object type, which is always `chat.completion`.
          object: :"chat.completion"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              choices: T::Array[DedalusSDK::Chat::Choice],
              created: Integer,
              model: String,
              object: Symbol,
              correlation_id: T.nilable(String),
              deferred:
                T.nilable(T::Array[DedalusSDK::Chat::DeferredCallResponse]),
              mcp_server_errors:
                T.nilable(
                  T::Hash[
                    Symbol,
                    DedalusSDK::Chat::ChatCompletion::MCPServerError
                  ]
                ),
              mcp_tool_results: T.nilable(T::Array[DedalusSDK::MCPToolResult]),
              pending_tools:
                T.nilable(
                  T::Array[DedalusSDK::Chat::ChatCompletion::PendingTool]
                ),
              server_results:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ]
                ),
              service_tier:
                T.nilable(
                  DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
                ),
              system_fingerprint: String,
              tools_executed: T.nilable(T::Array[String]),
              turns_consumed: T.nilable(Integer),
              usage: DedalusSDK::Chat::CompletionUsage
            }
          )
        end
        def to_hash
        end

        class MCPServerError < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletion::MCPServerError,
                DedalusSDK::Internal::AnyHash
              )
            end

          # Human-readable error message.
          sig { returns(String) }
          attr_accessor :message

          # Machine-readable error code.
          sig { returns(T.nilable(String)) }
          attr_accessor :code

          # Suggested action for the user.
          sig { returns(T.nilable(String)) }
          attr_accessor :recommendation

          # Error details for a single MCP server failure.
          sig do
            params(
              message: String,
              code: T.nilable(String),
              recommendation: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Human-readable error message.
            message:,
            # Machine-readable error code.
            code: nil,
            # Suggested action for the user.
            recommendation: nil
          )
          end

          sig do
            override.returns(
              {
                message: String,
                code: T.nilable(String),
                recommendation: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class PendingTool < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletion::PendingTool,
                DedalusSDK::Internal::AnyHash
              )
            end

          # Unique identifier for this tool call.
          sig { returns(String) }
          attr_accessor :id

          # Input arguments for the tool call.
          sig do
            returns(
              T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput::Variants)]
            )
          end
          attr_accessor :arguments

          # Name of the tool to execute.
          sig { returns(String) }
          attr_accessor :name

          # IDs of other pending calls that must complete first.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :dependencies

          sig { params(dependencies: T::Array[String]).void }
          attr_writer :dependencies

          # Client-side tool call the SDK must execute.
          sig do
            params(
              id: String,
              arguments:
                T::Hash[
                  Symbol,
                  T.nilable(DedalusSDK::JSONValueInput::Variants)
                ],
              name: String,
              dependencies: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this tool call.
            id:,
            # Input arguments for the tool call.
            arguments:,
            # Name of the tool to execute.
            name:,
            # IDs of other pending calls that must complete first.
            dependencies: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                arguments:
                  T::Hash[
                    Symbol,
                    T.nilable(DedalusSDK::JSONValueInput::Variants)
                  ],
                name: String,
                dependencies: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end

        # Specifies the processing type used for serving the request.
        #
        # - If set to 'auto', then the request will be processed with the service tier
        #   configured in the Project settings. Unless otherwise configured, the Project
        #   will use 'default'.
        # - If set to 'default', then the request will be processed with the standard
        #   pricing and performance for the selected model.
        # - If set to '[flex](/docs/guides/flex-processing)' or
        #   '[priority](https://openai.com/api-priority-processing/)', then the request
        #   will be processed with the corresponding service tier.
        # - When not set, the default behavior is 'auto'.
        #
        # When the `service_tier` parameter is set, the response body will include the
        # `service_tier` value based on the processing mode actually used to serve the
        # request. This response value may be different from the value set in the
        # parameter.
        module ServiceTier
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletion::ServiceTier)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTO =
            T.let(
              :auto,
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )
          DEFAULT =
            T.let(
              :default,
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )
          FLEX =
            T.let(
              :flex,
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )
          SCALE =
            T.let(
              :scale,
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )
          PRIORITY =
            T.let(
              :priority,
              DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletion::ServiceTier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
