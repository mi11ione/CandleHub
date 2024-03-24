//
//  CSCViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 23/3/24.
//

import SwiftUI

struct CandleStickChartViewModel {
    var candlesByTicker: [String: [Candle]]

    private var fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching, candlesByTicker: [String: [Candle]] = [:]) {
        self.fetcher = fetcher
        self.candlesByTicker = candlesByTicker
    }

    func fetchData(ticker: String) async -> [Candle]? {
        guard let fetchedCandles = await fetcher.getMoexCandles(ticker: ticker, timePeriod: .hour) else {
            return nil
        }
        return Array(fetchedCandles.suffix(10))
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
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
