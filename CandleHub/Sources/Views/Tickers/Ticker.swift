//
//  Ticker.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import Foundation

struct Ticker: Hashable {
    var tickerTitle: String
    var tickerPrice: String
    var tickerGraph: String
    var tickerImage: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(tickerTitle)
        hasher.combine(tickerPrice)
        hasher.combine(tickerGraph)
        hasher.combine(tickerImage)
    }

    static func == (lhs: Ticker, rhs: Ticker) -> Bool {
        lhs.tickerTitle == rhs.tickerTitle &&
            lhs.tickerPrice == rhs.tickerPrice &&
            lhs.tickerGraph == rhs.tickerGraph &&
            lhs.tickerImage == rhs.tickerImage
    }
}
