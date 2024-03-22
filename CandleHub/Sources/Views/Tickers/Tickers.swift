//
//  Tickers.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct Tickers: View {
    var tickers: [TickerMOEX]

    init(tickers: [TickerMOEX]) {
        self.tickers = tickers
    }

    var body: some View {
        VStack {
            TickersListView(tickers: tickers)
        }
    }
}
