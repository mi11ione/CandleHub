//
//  TickersGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct TickersGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var tickers: [TickerMOEX]

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 300)),
    ]

    init(tickers: [TickerMOEX]) {
        self.tickers = tickers
    }

    var body: some View {
        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
            ForEach(tickers, id: \.title) { ticker in
                TickerGridItemView(ticker: ticker)
                    .padding(.bottom)
            }
        }
        .padding(.top)
    }
}