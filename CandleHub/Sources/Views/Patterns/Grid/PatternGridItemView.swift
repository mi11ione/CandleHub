//
//  PatternGridItemView.swift
//  CandleHub
//
//  Created by 1 on 25.03.2024.
//

import Foundation
import SwiftUI

struct PatternGridItemView: View {
    let pattern: Pattern
    @Binding var selectedOption: Option
    @Environment(\.colorScheme) var colorScheme
    var viewModel: PatternsGridViewModel
    @State private var selectedPattern: Pattern?

    var body: some View {
        VStack {
            PatternStickChart(pattern: pattern, gridWidth: viewModel.gridWidth(for: selectedOption))
                .background(Rectangle().fill(Material.thin))
                .cornerRadius(30)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.title)

            Text("\(pattern.name)")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.body)
                .padding(.top, -6)
                .padding(.bottom, -6)
        }
    }
}
