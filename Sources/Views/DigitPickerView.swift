#if os(iOS)
//
//  DigitPickerView.swift
//  CounterPicker
//
//  Created by Oleksii Kolomiiets on 10/25/25.
//

import SwiftUI

struct DigitPickerView: View {
    private enum Constant {
        static let width: CGFloat = 60
        static let visibleHeight: CGFloat = 84
    }

    @Binding private var value: Int
    private var section: DigitSection

    init(value: Binding<Int>, section: DigitSection) {
        self._value = value
        self.section = section
    }

    var body: some View {
        Picker("", selection: $value) {
            ForEach(0..<10) { value in
                Text("\(value)")
                    .tag(value)
                    .fontWeight(section.fontWeight)
                    .foregroundStyle(section.color)
            }
        }
        .frame(width: Constant.width, height: Constant.visibleHeight)
        .clipped()
        .compositingGroup()
        .padding([.leading, .trailing], -9)
    }
}
#endif
