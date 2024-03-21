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
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(backgroundView)
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
        }
        
    private var textColor: Color {
        selectedOptions.isEmpty ? (colorScheme == .dark ? .white : .black) : (colorScheme == .dark ? .black : .white)
    }

    private var backgroundView: some View {
        Group {
            if selectedOptions.isEmpty {
                Rectangle().fill(Material.ultraThin)
            } else {
                Rectangle().fill(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
}
