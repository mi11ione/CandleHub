//
//  PatternsGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: GridViewModel
    var selectedOption: String

    var patterns: [Pattern]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.adaptiveColumn, spacing: 20) {
                ForEach(patterns, id: \.self) { item in
                    VStack {
                        HStack {
                            Text("\(item.name)")
                                .padding(.leading)
                            Spacer()
                            PatternStickChart(pattern: item)
                                .frame(width: 170)
                        }.frame(width: viewModel.gridWidth, height: 160, alignment: .center)
                            .background(Rectangle().fill(Material.thin))
                            .cornerRadius(30)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title)

                        Text("buy")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.body)
                    }
                }
                .padding(.bottom, -11)
            }
            .padding(.top)
            .padding(.horizontal, 10)
        }
        .onAppear {
            viewModel.updateLayout(for: selectedOption)
        }
    }
}
