// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DittoPresenceViewer",
    platforms: [
        .iOS(.v11)
        // .macOS(.v11)
    ],
    products: [
        .library(
            name: "DittoPresenceViewer",
            targets: ["DittoPresenceViewer"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/getditto/DittoSwiftPackage", from: "1.1.0"),
        .package(path: "../DittoSwiftPackage")
    ],
    targets: [
        .target(
            name: "DittoPresenceViewer",
            dependencies: [
                .product(name: "DittoSwift", package: "DittoSwiftPackage")
            ],
            resources: [
                .copy("Resources/index.html"),
                .copy("Resources/main.css"),
                .copy("Resources/main.js"),
            ]
        ),
        .testTarget(
            name: "DittoPresenceViewerTests",
            dependencies: ["DittoPresenceViewer"]),
    ]
)
