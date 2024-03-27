//
//  PatternsView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsView: View {
    @State private var selectedOption: Option = .bigPatterns
    @State private var selectedPattern: Pattern?
    @State private var selectedFilter: String = ""
    private var patterns: [Pattern] = PatternsRepository.patterns

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Patterns")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])

                    Spacer()
                    PatternsViewSwitch(selectedOption: $selectedOption)
                        .padding(.top, 13)
                }
            }
            ScrollView {
                Filters(selectedFilter: $selectedFilter)

                PatternsGridView(
                    patterns: selectedFilter.isEmpty ? patterns : patterns.filter { $0.filter == selectedFilter },
                    selectedOption: $selectedOption
                )
            }
        }
    }
}
