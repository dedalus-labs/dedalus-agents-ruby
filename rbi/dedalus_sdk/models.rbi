# typed: strong

module DedalusSDK
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

  JSONObjectInput =
    T.let(
      DedalusSDK::Models::JSONObjectInput,
      DedalusSDK::Internal::Type::Converter
    )

  JSONValueInput = DedalusSDK::Models::JSONValueInput

  ListModelsResponse = DedalusSDK::Models::ListModelsResponse

  MCPCredentials =
    T.let(
      DedalusSDK::Models::MCPCredentials,
      DedalusSDK::Internal::Type::Converter
    )

  MCPServerItem = DedalusSDK::Models::MCPServerItem

  MCPServers =
    T.let(DedalusSDK::Models::MCPServers, DedalusSDK::Internal::Type::Converter)

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
