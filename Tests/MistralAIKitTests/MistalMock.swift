//
//  MistralMock.swift
//
//
//  Created by Waqar Malik on 12/21/23.
//

import Foundation
@testable import MistralAIKit
import OpenAPIRuntime
import OpenAPIURLSession

public struct MistralMock: APIProtocol {
  public func createChatCompletion(_ input: MistralAIKit.Operations.createChatCompletion.Input) async throws -> MistralAIKit.Operations.createChatCompletion.Output {
    let data = try Bundle.module.data(forResource: "CreateChatResponse")
    let modelResponse = try JSONDecoder().decode(Components.Schemas.ChatCompletionResponse.self, from: data)
    return .ok(Operations.createChatCompletion.Output.Ok(
      body: .json(modelResponse)
    ))
  }

  public func createEmbedding(_ input: MistralAIKit.Operations.createEmbedding.Input) async throws -> MistralAIKit.Operations.createEmbedding.Output {
    let data = try Bundle.module.data(forResource: "CreateEmbeddingResponse")
    let modelResponse = try JSONDecoder().decode(Components.Schemas.EmbeddingResponse.self, from: data)
    return .ok(Operations.createEmbedding.Output.Ok(
      body: .json(modelResponse)
    ))
  }
  
  public func listModels(_ input: MistralAIKit.Operations.listModels.Input) async throws -> MistralAIKit.Operations.listModels.Output {
    let data = try Bundle.module.data(forResource: "ListModelsResponse")
    let modelResponse = try JSONDecoder().decode(Components.Schemas.ModelList.self, from: data)
    return .ok(Operations.listModels.Output.Ok(
      body: .json(modelResponse)
    ))
  }
}
