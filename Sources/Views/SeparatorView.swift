#if os(iOS)
//
//  SeparatorView.swift
//  CounterPicker
//
//  Created by Oleksii Kolomiiets on 10/27/25.
//

import SwiftUI

struct SeparatorView: View {
    private enum Constant {
        static let separator: String = ","
    }

    var body: some View {
        Text(Constant.separator)
            .fontWeight(.bold)
            .dynamicTypeSize(.xLarge)
            .padding(.top)
    }
}
#endif
