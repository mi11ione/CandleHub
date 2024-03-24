//
//  PatternsViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsViewSwitch: View {
    var options = ["Big patterns", "Small patterns"]
    @Environment(\.colorScheme) var colorScheme
    @Binding var viewModel: PatternsGridViewModel

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0)) {
                        viewModel.selectedOption = option
                    }
                }) {
                    HStack {
                        Text(option)
                        Spacer()
                        if viewModel.selectedOption == option {
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
