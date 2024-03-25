//
//  PatternsGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct PatternsGridView: View {
    @Binding var selectedOption: String
    var patterns: [Pattern]
    @State private var selectedPattern: Pattern?
    
    func gridWidth(for selectedOption: String) -> CGFloat {
        selectedOption == "Big patterns" ? 350 : 160
    }

    func adaptiveColumn(for selectedOption: String) -> [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))], spacing: 20) {
                ForEach(patterns, id: \.id) { pattern in
                    PatternGridItemView(pattern: pattern, selectedOption: selectedOption, gridWidth: gridWidth(for: selectedOption))
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
