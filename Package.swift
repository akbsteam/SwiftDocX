// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftDocX",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SwiftDocX",
            targets: ["SwiftDocX"]
        ),
        .executable(
            name: "SwiftDocXSample",
            targets: ["SwiftDocXSample"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "SwiftDocX",
            dependencies: ["ZIPFoundation"]
        ),
        .testTarget(
            name: "SwiftDocXTests",
            dependencies: ["SwiftDocX"]
        ),
        .executableTarget(
            name: "SwiftDocXSample",
            dependencies: ["SwiftDocX"]
        ),
    ]
)
