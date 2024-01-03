//
//  MistralAIKitTests.swift
//
//
//  Created by Waqar Malik on 12/21/23.
//

import XCTest
@testable import MistralAIKit

final class MistralAIKitTests: XCTestCase {
  let client: MistralKit = {
    var api = MistralKit(client: MistralMock())
    return api
  }()

  func testListModels() async throws {
    let models = try await client.listModels()
    XCTAssertNotNil(models)
  }
  
  func testCreateEmbedding() async throws {
    let request = Components.Schemas.EmbeddingRequest(model: "mistral-tiny", input: ["Embed this sentence.", "As well as this one."])
    let response = try await client.create(embedding: request)
    XCTAssertNotNil(response)
  }

  func testCreateChat() async throws {
    let payload = Components.Schemas.ChatCompletionRequest.messagesPayloadPayload(role: .user, content: "Hello, how are you?")
    let request = Components.Schemas.ChatCompletionRequest(model: "mistral-small", messages: [payload], max_tokens: 5)
    let response = try await client.create(chatCompletion: request)
    XCTAssertNotNil(response)
  }
}
