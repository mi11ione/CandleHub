//
//  FilterButton.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct FilterButton: View {
    var filter: String
    var options: [String]

    @State private var isMenuOpen: Bool = false
    @State private var selectedOptions: Set<String> = []

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    toggleOption(option)
                }) {
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text(filter)
                .font(.headline)
                .foregroundColor(selectedOptions.isEmpty ? Color.black : Color.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(selectedOptions.isEmpty ? Color.gray.opacity(0.2) : Color.black)
                .cornerRadius(10)
        }
        .onTapGesture {
            if options.isEmpty {
                toggleOption(filter)
            }
        }
    }

    private func toggleOption(_ option: String) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }

        if selectedOptions.isEmpty {
            isMenuOpen = false
        } else {
            isMenuOpen = true
        }
    }
}
