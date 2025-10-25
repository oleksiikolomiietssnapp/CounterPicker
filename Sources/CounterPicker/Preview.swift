// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


#Preview {
    @Previewable @State var v: Double = 2
    CounterPicker(selectedValue: $v)
}
