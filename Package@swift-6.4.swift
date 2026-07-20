// swift-tools-version:6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "analytics-connector-ios",
    platforms: [
        .iOS(.v12),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AnalyticsConnector",
            targets: ["AnalyticsConnector"]
        ),
        .library(
            name: "AnalyticsConnectorFramework",
            targets: ["AnalyticsConnectorFramework"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .target(
            name: "AnalyticsConnector",
            path: "Sources/AnalyticsConnector",
            exclude: ["Info.plist"],
            swiftSettings: [.swiftLanguageMode(.v5)]),
        .binaryTarget(name: "AnalyticsConnectorFramework",
            url: "https://github.com/amplitude/analytics-connector-ios/releases/download/v1.3.2/AnalyticsConnector.xcframework.zip",
            checksum: "a9b36ea004c3631a1c59c8a78ed0ca0e1b115c6663d47d6596403b481c85c75a"),
        .testTarget(
            name: "AnalyticsConnectorTests",
            dependencies: ["AnalyticsConnector"],
            path: "Tests/AnalyticsConnectorTests",
            exclude: ["Info.plist", "ObjectiveCTests.m"],
            swiftSettings: [.swiftLanguageMode(.v5)]),
    ]
)
