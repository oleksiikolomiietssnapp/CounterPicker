//
//  DigitPickerView.swift
//  CounterPicker
//
//  Created by Oleksii Kolomiiets on 10/25/25.
//


struct DigitPickerView: View {
    @Binding var value: Int

    var body: some View {
        Picker("", selection: $value) {
            ForEach(0..<10) { value in
                Text("\(value)").tag(value)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 60, height: 96)
        .clipped()
        .compositingGroup()
        .padding([.leading, .trailing], -9)
    }
}