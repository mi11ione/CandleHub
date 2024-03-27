import SwiftUI

enum Adapter {
    static func adaptCandle(candles: [Candle]) -> [Double] {
        var candleSettings: [Double] = []

        for candle in candles {
            let volumeValue = candle.volume ?? 0.0

            candleSettings.append(contentsOf: [candle.openPrice, candle.highPrice, candle.lowPrice, candle.closePrice, volumeValue])
        }

        return candleSettings
    }
}
