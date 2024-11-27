// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "analytics-connector-ios",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4),
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
            exclude: ["Info.plist"]),
        .binaryTarget(name: "AnalyticsConnectorFramework",
            url: "https://github.com/amplitude/analytics-connector-ios/releases/download/v1.3.0/AnalyticsConnector.xcframework.zip",
            checksum: "afbe073a8a41acf8aa02177db649f1756335ac4d00f779250320a10c3af1baaf"),
        .testTarget(
            name: "AnalyticsConnectorTests",
            dependencies: ["AnalyticsConnector"],
            path: "Tests/AnalyticsConnectorTests",
            exclude: ["Info.plist"]),
    ]
)
