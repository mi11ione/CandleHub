//
//  PatternsViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsViewSwitch: View {
    var options = ["2 columns", "3 columns"]

    @Environment(\.colorScheme) var colorScheme

    @State private var isMenuOpen: Bool = false
    @State var selectedOption: Set<String> = ["2 columns"]

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    toggleOption(option)
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
        .padding(.trailing)
        .actionSheet(isPresented: $isMenuOpen) {
            ActionSheet(title: Text("Select grid"), message: nil, buttons: [
                .default(Text("3 columns"), action: { toggleOption("3") }),
                .default(Text("2 columns"), action: { toggleOption("2") }),
                .cancel(),
            ])
        }
    }

    private func toggleOption(_ option: String) {
        selectedOption.removeAll()
        selectedOption.insert(option)
    }
}
