//
//  FilterButton.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct FilterButton: View {
    @Environment(\.colorScheme) var colorScheme

    var filter: String
    @State private var isSelected: Bool = false

    var body: some View {
        Button(action: {
            toggleSelection()
        }) {
            Text(filter)
                .font(.headline)
                .foregroundColor(textColor)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(backgroundView)
                .cornerRadius(10)
        }
    }

    private func toggleSelection() {
        isSelected.toggle()
    }

    private var textColor: Color {
        isSelected ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black)
    }

    private var backgroundView: some View {
        Group {
            if isSelected == false {
                Rectangle().fill(Material.ultraThin)
            } else {
                Rectangle().fill(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
}
