// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "EARestrictedScrollView",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "EARestrictedScrollView",
            targets: ["EARestrictedScrollView"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EARestrictedScrollView",
            dependencies: [],
            path: "Source",
            linkerSettings: [
                .linkedFramework("UIKit"),
            ]
        ),
    ]
)
