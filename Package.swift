// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "CounterPicker",
    products: [
        .library(name: "CounterPicker", targets: ["CounterPicker"])
    ],
    targets: [
        .target(name: "CounterPicker"),
        .testTarget(name: "CounterPickerTests", dependencies: ["CounterPicker"]),
    ]
)
