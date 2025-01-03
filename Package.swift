// swift-tools-version: 5.8.1

import PackageDescription

let package = Package(
    name: "DittoPresenceViewerCore",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .macCatalyst(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "DittoPresenceViewerCore",
            targets: ["DittoPresenceViewerCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/getditto/DittoSwiftPackage", from: "4.8.0") // 4.8.0 is required for peerKeyString in presence data
    ],
    targets: [
        .target(
            name: "DittoPresenceViewerCore",
            dependencies: [
                .product(name: "DittoSwift", package: "DittoSwiftPackage")
            ],
            path: "Swift/Sources/DittoPresenceViewerCore",
            resources: [
                .copy("Resources")
            ],
            cxxSettings: [
                .define("ENABLE_BITCODE", to: "NO")
            ]
        )
    ]
)
