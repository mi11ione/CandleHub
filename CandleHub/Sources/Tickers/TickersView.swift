//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct TickersView: View {
    var tickers: [Ticker] {
        (0..<8).map { _ in
            Ticker(tickerTitle: "",
                   tickerPrice: "",
                   tickerGraph: "",
                   tickerImage: "")
        }
    }

    var body: some View {
        NavigationView {
            TickersListView(tickers: tickers)
        }
    }
}
