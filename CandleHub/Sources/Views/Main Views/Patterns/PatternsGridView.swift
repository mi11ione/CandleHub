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
    
    init(viewModel: GridViewModel) {
        self.viewModel = viewModel
    }

    private var data = Array(1...20)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.adaptiveColumn, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    VStack {
                        Text("Pattern \(String(item))")
                            .frame(width: viewModel.gridWidth, height: 160, alignment: .center)
                            .background(Rectangle().fill(Material.thin))
                            .cornerRadius(30)
                            .foregroundColor(self.colorScheme == .dark ? .white : .black)
                            .font(.title)

                        Text("Subtitle \(item)")
                            .foregroundColor(self.colorScheme == .dark ? .white : .black)
                            .font(.body)
                    }
                    .padding(.bottom, -11)
                }
            }
            .padding()
        }
    }
}
