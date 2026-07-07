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
            url: "https://github.com/amplitude/analytics-connector-ios/releases/download/v1.3.1/AnalyticsConnector.xcframework.zip",
            checksum: "e1817080261a7d156c43c5e79954a00917a2c5682bddf3a2ba9a498aa68f7c9f"),
        .testTarget(
            name: "AnalyticsConnectorTests",
            dependencies: ["AnalyticsConnector"],
            path: "Tests/AnalyticsConnectorTests",
            exclude: ["Info.plist"],
            swiftSettings: [.swiftLanguageMode(.v5)]),
    ]
)
