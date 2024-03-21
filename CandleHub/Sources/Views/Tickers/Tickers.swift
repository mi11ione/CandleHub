//
//  Tickers.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct Tickers: View {
    var tickers: [Ticker] {
        (0..<8).map { _ in
            Ticker(tickerTitle: "",
                   tickerPrice: "",
                   tickerGraph: "",
                   tickerImage: "")
        }
    }

    var body: some View {
        VStack {
            TickersListView(tickers: tickers)
        }
    }
}
