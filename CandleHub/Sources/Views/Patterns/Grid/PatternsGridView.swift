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

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: viewModel.gridWidth(for: selectedOption)))]
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(patterns, id: \.id) { item in
                VStack {
                    PatternStickChart(pattern: item, gridWidth: viewModel.gridWidth(for: selectedOption))
                        .background(Rectangle().fill(Material.thin))
                        .cornerRadius(30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.title)

                    Text("\(item.name)")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.body)
                        .padding(.top, -6)
                        .padding(.bottom, -6)
                }
            }
        }
        .padding([.top, .horizontal])
    }
}
