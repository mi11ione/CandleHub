//
//  CSCViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 23/3/24.
//

import SwiftUI

class CandleStickChartViewModel: ObservableObject {
    @Published var candles: [Candle] = []
    @Published var candlesByTicker: [String: [Candle]] = [:]
    private var fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }

    func fetchData() {
        Task {
            if let tickers = await fetcher.getMoexTickers() {
                for ticker in tickers {
                    let allCandles = await fetcher.getMoexCandles(ticker: ticker.title, timePeriod: .hour) ?? []
                    DispatchQueue.main.async {
                        self.candlesByTicker[ticker.title] = Array(allCandles.suffix(10))
                    }
                }
            }
        }
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }

    func calculateYAxisDomain(for ticker: String) -> ClosedRange<Double> {
        guard let candles = candlesByTicker[ticker], !candles.isEmpty else {
            return 0 ... 100
        }
        let lowPrices = candles.map(\.lowPrice)
        let highPrices = candles.map(\.highPrice)
        guard let minPrice = lowPrices.min(), let maxPrice = highPrices.max() else {
            return 0 ... 100
        }
        let padding = (maxPrice - minPrice) * 0.15
        return (minPrice - padding) ... (maxPrice + padding)
    }
}
