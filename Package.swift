// swift-tools-version: 5.11

// tools 5.11 is required to access shared resources outside of the target's Sources directory (see https://github.com/swiftlang/swift-package-manager/issues/6982)

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
            name: "DittoPresenceViewer",
            targets: ["DittoPresenceViewer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/getditto/DittoSwiftPackage", from: "4.8.0") // 4.8.0 is required for peerKeyString in presence data
    ],
    targets: [
        .target(
            name: "DittoPresenceViewer",
            dependencies: [
                .product(name: "DittoSwift", package: "DittoSwiftPackage")
            ],
            path: "Swift/Sources/DittoPresenceViewer",
            resources: [
                .copy("../../../Shared"),
                .copy("Resources") // required to avoid Xcode erroring with "Type 'Bundle' has no member 'module'". The real resources are shared across all languages, and found at the package root in "Shared"
            ]
        )
    ]
)
