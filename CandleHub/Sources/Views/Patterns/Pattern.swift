//
//  Pattern.swift
//  CandleHub
//
//  Created by 1 on 23.03.2024.
//

import Foundation

struct Pattern: Hashable {
    static func == (lhs: Pattern, rhs: Pattern) -> Bool {
        lhs.name == rhs.name &&
        lhs.candles == rhs.candles &&
        lhs.info == rhs.info
    }
    
    let name: String
    let candles: [Candle]
    let info: String
    
    func calculateYAxisDomain() -> ClosedRange<Double> {
        let lowPrices = candles.map { $0.lowPrice }
        let highPrices = candles.map { $0.highPrice }
        guard let minPrice = lowPrices.min(), let maxPrice = highPrices.max() else {
            return 0...100
        }
        let padding = (maxPrice - minPrice) * 0.15
        return (minPrice - padding)...(maxPrice + padding)
    }
}
