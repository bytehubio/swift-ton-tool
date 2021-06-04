// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-ton-sdk-kit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "swift-ton-sdk-kit",
            targets: ["swift-ton-sdk-kit"]),
    ],
    dependencies: [
        .package(name: "TonClientSwift", url: "https://github.com/nerzh/ton-client-swift.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "swift-ton-sdk-kit",
            dependencies: [
                .product(name: "TonClientSwift", package: "TonClientSwift"),
            ])
    ]
)
