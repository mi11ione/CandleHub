//
//  PatternsGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var viewModel: PatternsGridViewModel
    var patterns: [Pattern]

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: viewModel.gridWidth))]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(patterns, id: \.id) { item in
                    VStack {
                        PatternStickChart(pattern: item, gridWidth: viewModel.gridWidth)
                            .background(Rectangle().fill(Material.thin))
                            .cornerRadius(30)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title)

                        Text("\(item.name)")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.body)
                            .padding(.top, -6)
                    }
                }
            }
            .padding([.horizontal, .top])
        }
    }
}
