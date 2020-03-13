// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MiniBuddy",
    products: [
        .executable(name: "minibuddy", targets: ["minibuddy"]),
        // .library(name: "MiniBuddyFramework", targets: ["Framework"])
    ],
    dependencies: [
        .package(url: "https://github.com/Carthage/Commandant.git", .upToNextMinor(from: "0.17.0")),
    ],
    targets: [
        .target(
            name: "minibuddy",
            dependencies: [
                "Commandant",
                // "MiniBuddyFramework",
            ]
        ),
        // .target(
        //     name: "MiniBuddyFramework",
        //     dependencies: []
        // ),
        .testTarget(
            name: "MiniBuddyTests",
            dependencies: ["minibuddy"]
        )
    ]
)
