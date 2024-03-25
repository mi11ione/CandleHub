//
//  PatternsGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var viewModel: PatternsGridViewModel
    @Binding var selectedOption: String
    var patterns: [Pattern]
    @State private var selectedPattern: Pattern?

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: viewModel.gridWidth(for: selectedOption)))]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(patterns, id: \.id) { pattern in
                    PatternGridItemView(pattern: pattern, selectedOption: selectedOption, gridWidth: viewModel.gridWidth(for: selectedOption))
                        .onTapGesture {
                            selectedPattern = pattern
                        }
                }
            }
            .padding([.top, .horizontal])
        }
        .sheet(item: $selectedPattern) { pattern in
            PatternSheetView(pattern: pattern, gridWidth: 300)
        }
    }
}
