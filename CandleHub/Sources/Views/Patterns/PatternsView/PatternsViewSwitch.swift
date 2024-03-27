//
//  PatternsViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

enum Option: String {
    case bigPatterns = "Big patterns"
    case smallPatterns = "Small patterns"
}

struct PatternsViewSwitch: View {
    @Environment(\.colorScheme) var colorScheme
    let options: [Option] = [.bigPatterns, .smallPatterns]
    @Binding var selectedOption: Option

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation(.spring) {
                        selectedOption = option
                    }
                }) {
                    HStack {
                        Text(option.rawValue)
                        Spacer()
                        if selectedOption == option {
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
}
