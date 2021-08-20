// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTonTool",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftTonTool",
            targets: ["SwiftTonTool"]),
    ],
    dependencies: [
        .package(name: "TonClientSwift", url: "https://github.com/nerzh/ton-client-swift.git", .upToNextMajor(from: "1.1.9")),
        .package(name: "BigInt", url: "https://github.com/attaswift/BigInt.git", from: "5.2.1"),
    ],
    targets: [
        .target(
            name: "SwiftTonTool",
            dependencies: [
                .product(name: "TonClientSwift", package: "TonClientSwift"),
                .product(name: "BigInt", package: "BigInt"),
            ])
    ]
)
