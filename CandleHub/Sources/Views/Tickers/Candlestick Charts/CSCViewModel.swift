//
//  CSCViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 23/3/24.
//

import SwiftUI

class CandleStickChartViewModel: ObservableObject {
    @Published var candles: [Candle] = []
    private var fetcher: TradingDataNetworkFetching
    
    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }
    
    func fetchData() {
        Task {
            if let tickers = await fetcher.getMoexTickers(), let firstTicker = tickers.first {
                let allCandles = await fetcher.getMoexCandles(ticker: firstTicker.title, timePeriod: .hour) ?? []
                DispatchQueue.main.async {
                    self.candles = Array(allCandles.suffix(5))
                    print(self.candles)
                }
            }
        }
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: date)
    }
}
