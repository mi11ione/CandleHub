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
    @Binding var isSelected: Bool
    
    var onSelectionChange: ((Bool) -> Void)?

    var body: some View {
        Button(action: {
            withAnimation(.smooth) {
                let newState = !isSelected
                isSelected = newState
                onSelectionChange?(newState)
            }
        }) {
            Text(filter)
                .font(.headline)
                .foregroundColor(isSelected ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black))
                .padding(.horizontal, 15)
                .padding(.vertical, 7)
                .background(backgroundView)
                .cornerRadius(10)
        }
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
