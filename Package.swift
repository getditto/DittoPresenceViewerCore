// swift-tools-version: 5.8.1

import PackageDescription

let package = Package(
    name: "DittoPresenceViewer",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .macCatalyst(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "DittoPresence",
            targets: ["DittoPresence"]),
    ],
    dependencies: [
        .package(url: "https://github.com/getditto/DittoSwiftPackage", from: "4.8.0") // 4.8.0 is required for peerKeyString in presence data
    ],
    targets: [
        .target(
            name: "DittoPresence",
            dependencies: [
                .product(name: "DittoSwift", package: "DittoSwiftPackage")
            ],
            path: "Swift/Sources/DittoPresenceViewer",
            resources: [
                .copy("Resources")
            ],
            cxxSettings: [
                .define("ENABLE_BITCODE", to: "NO")
            ]
        )
    ]
)
