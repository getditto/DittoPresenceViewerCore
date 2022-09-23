// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DittoPresenceViewer",
    platforms: [.macOS(.v11), .iOS(.v11)],
    products: [
        .library(
            name: "DittoPresenceViewer",
            targets: ["DittoPresenceViewer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/getditto/DittoSwiftPackage", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "DittoPresenceViewer",
            dependencies: [
                .product(name: "DittoSwift", package: "DittoSwiftPackage")
            ]),
        .testTarget(
            name: "DittoPresenceViewerTests",
            dependencies: ["DittoPresenceViewer"]),
    ]
)
