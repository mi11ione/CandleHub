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
        TextField("Search tickers", text: $checkAmount)
            .padding(.vertical, 7)
            .padding(.horizontal, 12)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .focused($amountIsFocused)
    }
}
