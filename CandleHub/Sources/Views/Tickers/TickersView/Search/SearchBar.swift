//
//  SearchBar.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var checkAmount: String
    @FocusState private var amountIsFocused: Bool

    var body: some View {
        TextField("\(Image(systemName: "sparkle.magnifyingglass")) Search tickers", text: $checkAmount)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Rectangle().fill(Material.ultraThin))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .focused($amountIsFocused)
    }
}
