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
}
