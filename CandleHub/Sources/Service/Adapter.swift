//
//  Adapter.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 22.03.2024.
//

import SwiftUI

struct Adapter {
    
    static func adaptCandle(candles: [Candle]) -> [Double] {
        
        var candleSettings: [Double] = []
        
        candles.forEach { candle in
            
            candleSettings.append(contentsOf: [candle.openPrice, candle.highPrice, candle.lowPrice, candle.closePrice, candle.volume])
            
        }
        
        return candleSettings
        
    }
    
}
