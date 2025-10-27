// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CounterPicker",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "CounterPicker", targets: ["CounterPicker"])
    ],
    targets: [
        .target(name: "CounterPicker", path: "Sources/"),
        .testTarget(name: "CounterPickerTests", dependencies: ["CounterPicker"], path: "Tests/"),
    ]
)
