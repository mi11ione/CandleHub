//
//  Converter.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 28.03.2024.
//

import SwiftUI

enum Converter {
    static func convertDetectedPatternIntoPattern(detectedPattern: DetectedPattern, candles: [Candle]) -> Pattern {
        var resultCandles: [Candle] = []
        for candle in candles {
            if detectedPattern.dates.contains(candle.date) {
                resultCandles.append(candle)
            }
        }

        let pattern = Pattern(
            name: detectedPattern.name,
            candles: resultCandles.map { candle in
                var candle = candle

                let calendar = Calendar(identifier: .gregorian)
                var components = DateComponents()

                let componentsBefore = calendar.dateComponents([.minute], from: candle.date)

                components.hour = componentsBefore.minute
                let date = calendar.date(from: components as DateComponents)
                candle.date = date!
                return candle

            },
            info: "",
            filter: ""
        )

        return pattern
    }
}
