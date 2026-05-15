# frozen_string_literal: true

module DedalusSDK
  [DedalusSDK::Internal::Type::BaseModel, *DedalusSDK::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, DedalusSDK::Internal::AnyHash) } }
  end

  DedalusSDK::Internal::Util.walk_namespaces(DedalusSDK::Models).each do |mod|
    case mod
    in DedalusSDK::Internal::Type::Enum | DedalusSDK::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  DedalusSDK::Internal::Util.walk_namespaces(DedalusSDK::Models)
                            .lazy
                            .grep(DedalusSDK::Internal::Type::Union)
                            .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Audio = DedalusSDK::Models::Audio

  Chat = DedalusSDK::Models::Chat

  CreateEmbeddingRequest = DedalusSDK::Models::CreateEmbeddingRequest

  CreateEmbeddingResponse = DedalusSDK::Models::CreateEmbeddingResponse

  CreateImageRequest = DedalusSDK::Models::CreateImageRequest

  Credential = DedalusSDK::Models::Credential

  DedalusModel = DedalusSDK::Models::DedalusModel

  DedalusModelChoice = DedalusSDK::Models::DedalusModelChoice

  EmbeddingCreateParams = DedalusSDK::Models::EmbeddingCreateParams

  FunctionDefinition = DedalusSDK::Models::FunctionDefinition

  Image = DedalusSDK::Models::Image

  ImageCreateVariationParams = DedalusSDK::Models::ImageCreateVariationParams

  ImageEditParams = DedalusSDK::Models::ImageEditParams

  ImageGenerateParams = DedalusSDK::Models::ImageGenerateParams

  ImagesResponse = DedalusSDK::Models::ImagesResponse

  # @type [DedalusSDK::Internal::Type::Converter]
  JSONObjectInput = DedalusSDK::Models::JSONObjectInput

  JSONValueInput = DedalusSDK::Models::JSONValueInput

  ListModelsResponse = DedalusSDK::Models::ListModelsResponse

  # @type [DedalusSDK::Internal::Type::Converter]
  MCPCredentials = DedalusSDK::Models::MCPCredentials

  MCPServerItem = DedalusSDK::Models::MCPServerItem

  # @type [DedalusSDK::Internal::Type::Converter]
  MCPServers = DedalusSDK::Models::MCPServers

  MCPServerSpec = DedalusSDK::Models::MCPServerSpec

  MCPToolResult = DedalusSDK::Models::MCPToolResult

  Model = DedalusSDK::Models::Model

  ModelListParams = DedalusSDK::Models::ModelListParams

  ModelRetrieveParams = DedalusSDK::Models::ModelRetrieveParams

  ModelSettings = DedalusSDK::Models::ModelSettings

  OCRDocument = DedalusSDK::Models::OCRDocument

  OCRPage = DedalusSDK::Models::OCRPage

  OCRProcessParams = DedalusSDK::Models::OCRProcessParams

  OCRRequest = DedalusSDK::Models::OCRRequest

  OCRResponse = DedalusSDK::Models::OCRResponse

  Reasoning = DedalusSDK::Models::Reasoning

  Response = DedalusSDK::Models::Response

  ResponseCreateParams = DedalusSDK::Models::ResponseCreateParams

  ResponseFormatJSONObject = DedalusSDK::Models::ResponseFormatJSONObject

  ResponseFormatJSONSchema = DedalusSDK::Models::ResponseFormatJSONSchema

  ResponseFormatText = DedalusSDK::Models::ResponseFormatText

  ToolChoice = DedalusSDK::Models::ToolChoice

  VoiceIDsOrCustomVoice = DedalusSDK::Models::VoiceIDsOrCustomVoice
end
