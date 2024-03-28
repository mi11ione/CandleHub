//
//  Converter.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 28.03.2024.
//

import SwiftUI

struct Converter {
    
    static func convertDetectedPatternIntoPattern(detectedPattern: DetectedPattern, candles: [Candle]) -> Pattern {
        
        var resultCandles: [Candle] = []
        candles.forEach { candle in
            if detectedPattern.dates.contains(candle.date) {
                resultCandles.append(candle)
            }
        }
        
        let pattern = Pattern(
            name: detectedPattern.name,
            candles: resultCandles,
            info: "",
            filter: "")
        
        return pattern
        
    }
    
}
