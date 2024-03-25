//
//  PatternsView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsView: View {
    @State private var selectedOption: String = "Big patterns"
    private var viewModel = PatternsGridViewModel()

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
                Filters()

                PatternsGridView(
                    viewModel: viewModel,
                    selectedOption: $selectedOption,
                    patterns: PatternsRepository.patterns
                )
            }
        }
    }
}