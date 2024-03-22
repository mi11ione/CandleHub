//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText: String = ""

    @StateObject var tickersViewModel = TickersViewModel()

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("CandleHub")
                    var set = CandlePredictor.predict(candles: [Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0), Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0), Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0), Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0), Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0), Candle(date: "", openPrice: 10.0, closePrice: 10.0, highPrice: 10.0, lowPrice: 10.0, value: 10.0, volume: 10.0)])
                    Text("\(set[0])")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    Spacer()
                    TickersViewSwitch()
                }
                SearchBar(checkAmount: $searchText)
                    .padding(.horizontal, 22)
                    .padding(.vertical, -3)
                TickersGridView(tickers: tickersViewModel.array ?? [])
            }.onAppear {
                tickersViewModel.fetchTickers()
            }
        }
    }
}
