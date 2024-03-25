//
//  CSCVMExtension.swift
//  CandleHub
//
//  Created by mi11ion on 25/3/24.
//

import Foundation

extension CandleStickChartViewModel {
    mutating func addPredictedCandle(for ticker: String) {
        guard var candles = candlesByTicker[ticker] else { return }

        let predictedValues = CandlePredictor.predict(candles: candles)
        if predictedValues.count == 5 {
            let predictedCandle = Candle(
                date: Date().addingTimeInterval(3600),
                openPrice: predictedValues[0],
                closePrice: predictedValues[1],
                highPrice: predictedValues[2],
                lowPrice: predictedValues[3],
                volume: predictedValues[4]
            )

            candles.append(predictedCandle)
            candlesByTicker[ticker] = candles
        }
    }
}
