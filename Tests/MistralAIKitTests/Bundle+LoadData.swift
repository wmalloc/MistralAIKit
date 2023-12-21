//
//  Bundle+LoadData.swift
//
//  Created by Waqar Malik on 12/21/23.
//

import Foundation

extension Bundle {
  func data(forResource: String, withExtension: String = "json", subdirectory: String = "TestData") throws -> Data {
    guard let url = url(forResource: forResource, withExtension: withExtension, subdirectory: subdirectory) else {
      throw URLError(.fileDoesNotExist)
    }
    let data = try Data(contentsOf: url, options: [.mappedIfSafe])
    return data
  }
}
