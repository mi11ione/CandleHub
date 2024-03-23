//
//  Adapter.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 22.03.2024.
//

import SwiftUI

enum Adapter {
    static func adaptCandle(candles: [Candle]) -> [Double] {
        var candleSettings: [Double] = []

        for candle in candles {
            candleSettings.append(contentsOf: [candle.openPrice, candle.highPrice, candle.lowPrice, candle.closePrice, candle.volume])
        }

        return candleSettings
    }
}
