//
//  PatternsViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsViewSwitch: View {
    var options = ["1 Column", "2 Columns"]
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: GridViewModel

    init(viewModel: GridViewModel) {
        self.viewModel = viewModel
    }

    @State private var isMenuOpen: Bool = false
    @State var selectedOption: Set<String> = ["1 Column"]

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    toggleOption(option)
                    viewModel.updateLayout(for: option)
                }) {
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedOption.contains(option) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack {
                Image(systemName: "app.dashed")
                Text("Grid")
            }
            .font(.headline).bold()
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        .padding(.trailing, 20)
    }

    private func toggleOption(_ option: String) {
        selectedOption.removeAll()
        selectedOption.insert(option)
    }
}
