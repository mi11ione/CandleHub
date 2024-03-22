//
//  PatternsView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsView: View {
    @StateObject private var viewModel = GridViewModel()
    @AppStorage("selectedGridOption") var selectedOption: String = "Big patterns"

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Patterns")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])

                    Spacer()
                    PatternsViewSwitch(viewModel: viewModel, selectedOption: $selectedOption)
                        .padding(.top, 13)
                }
                Filters()
            }
            PatternsGridView(viewModel: viewModel, selectedOption: selectedOption)
        }
        .onAppear {
            viewModel.updateLayout(for: selectedOption)
        }
    }
}
