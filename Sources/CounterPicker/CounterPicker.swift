//
//  CounterPicker.swift
//  CounterPicker
//
//  Created by Oleksii Kolomiiets on 10/25/25.
//


import SwiftUI

public struct CounterPicker: View {
    @State private var viewModel: PickerViewModel
    @Binding private var selectedValue: Double

    init(
        selectedValue: Binding<Double>
    ) {
        self._selectedValue = selectedValue

        let value = selectedValue.wrappedValue
        self.viewModel = PickerViewModel(reading: value)
    }

    public var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(viewModel.counts.indices, id: \.self) { index in
                    DigitPickerView(value: $viewModel.counts[index])
                }
                Text(".")
                    .fontWeight(.bold)
                ForEach(viewModel.fractions.indices, id: \.self) { index in
                    Picker("", selection: $viewModel.fractions[index]) {
                        ForEach(0..<10) { value in
                            Text("\(value)").tag(value)
                                .foregroundStyle(Color.red)
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(width: 60, height: 96)
                    .clipped()
                    .compositingGroup()
                    .padding([.leading, .trailing], -9)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 60)
            .padding(12)
        }
        //        .onChange(of: viewModel.counts) { _, newValue in
        //            if let newNumber = viewModel.recalculateCurrentNumber() {
        //                selectedValue = newNumber
        //            }
        //        }
        //        .onChange(of: viewModel.fractions) { _, _ in
        //            if let newNumber = viewModel.recalculateCurrentNumber() {
        //                selectedValue = newNumber
        //            }
        //        }
        //        .onChange(of: selectedValue) { _, newValue in
        //            viewModel.updateReading(newValue)
        //        }
        //        .onAppear {
        //            if let reading = readings.first(where: { $0.persistentModelID == readingID }) {
        //                viewModel.updateReading(reading.value)
        //            }
        //        }
    }
}