
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession
import OSLog

public protocol MistralAPI {
  func listModels() async throws -> Components.Schemas.ModelList
  func create(embedding request: Components.Schemas.EmbeddingRequest) async throws -> Components.Schemas.EmbeddingResponse
  func create(chatCompletion request: Components.Schemas.ChatCompletionRequest) async throws -> Components.Schemas.ChatCompletionResponse
}

private let log = Logger(subsystem: "com.waqarmalik.mistralaikit", category: "MistralKit")

public final class MistralKit<ClientType: APIProtocol> {
  public let client: ClientType
  
  public init(client: ClientType) {
    self.client = client
  }
  
  public init(server url: URL, sessionConfiguration: URLSessionConfiguration = .default) where ClientType == Client {
    self.client = Client(serverURL: url, transport: URLSessionTransport(configuration: .init(session: URLSession(configuration: sessionConfiguration))))
  }
}

extension MistralKit: MistralAPI {
  public func listModels() async throws -> Components.Schemas.ModelList {
    let input = MistralAIKit.Operations.listModels.Input()
    let response = try await client.listModels(input)
    switch response {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let modelResponse):
        return modelResponse
      }
    case .undocumented(let statusCode, _):
      log.error("\(statusCode)")
      throw URLError(URLError.Code(rawValue: statusCode))
    }
  }
  
  public func create(embedding request: Components.Schemas.EmbeddingRequest) async throws -> Components.Schemas.EmbeddingResponse {
    let input = MistralAIKit.Operations.createEmbedding.Input(body: .json(request))
    let response = try await client.createEmbedding(input)
    switch response {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let modelResponse):
        return modelResponse
      }
    case .undocumented(let statusCode, _):
      log.error("\(statusCode)")
      throw URLError(URLError.Code(rawValue: statusCode))
    }
  }
  
  public func create(chatCompletion request: Components.Schemas.ChatCompletionRequest) async throws -> Components.Schemas.ChatCompletionResponse {
    let input = MistralAIKit.Operations.createChatCompletion.Input(body: .json(request))
    let response = try await client.createChatCompletion(input)
    switch response {
    case .ok(let okResponse):
      switch okResponse.body {
      case .json(let modelResponse):
        return modelResponse
      }
    case .undocumented(let statusCode, _):
      log.error("\(statusCode)")
      throw URLError(URLError.Code(rawValue: statusCode))
    }
  }
}
