//
//  TickersListView.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct TickersListView: View {
    let tickers: [Ticker]

    var body: some View {
        List {
            ForEach(tickers, id: \.tickerTitle) { ticker in
                Section {
                    TickerView(ticker: ticker)
                }
            }
        }
    }
}
