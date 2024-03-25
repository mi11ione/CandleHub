//
//  PatternsViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsViewSwitch: View {
    @Environment(\.colorScheme) var colorScheme
    var options = ["Big patterns", "Small patterns"]
    @Binding var selectedOption: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation() {
                        selectedOption = option
                    }
                }) {
                    HStack {
                        Text(option)
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
