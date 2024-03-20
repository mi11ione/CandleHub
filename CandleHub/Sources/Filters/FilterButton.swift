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
                .foregroundColor(self.textColor)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(self.backgroundColor)
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
    
    private var textColor: Color {
        if selectedOptions.isEmpty {
            return colorScheme == .dark ? .white : .black
        } else {
            return colorScheme == .dark ? .black : .white
        }
    }

    private var backgroundColor: Color {
        if selectedOptions.isEmpty {
            return colorScheme == .dark ? Color.white.opacity(0.2) : Color.gray.opacity(0.2)
        } else {
            return colorScheme == .dark ? .white : .black
        }
    }
}
