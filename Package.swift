// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MistralAIKit",
  defaultLocalization: "en",
  platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14), .watchOS(.v10), .macCatalyst(.v17), .visionOS(.v1)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(name: "MistralAIKit", targets: ["MistralAIKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator.git", .upToNextMajor(from: "1.1.0")),
    .package(url: "https://github.com/apple/swift-openapi-urlsession.git", .upToNextMajor(from: "1.0.0")),
    .package(url: "https://github.com/apple/swift-openapi-runtime.git", .upToNextMinor(from: "1.1.0")),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(name: "MistralAIKit", dependencies: [.product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                                                 .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")],
            plugins: [.plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")]),
    .testTarget( name: "MistralAIKitTests", dependencies: ["MistralAIKit",
                                                           .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                                                           .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")],
                 resources: [.copy("TestData")]),
  ]
)
