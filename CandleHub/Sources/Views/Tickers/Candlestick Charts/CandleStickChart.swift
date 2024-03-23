//
//  CandleStickChart.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import Charts
import SwiftUI

struct CandleStickChart: View {
    let candles: [Candle] = [
        .init(open: 3, close: 6, low: 1, high: 8),
        .init(open: 4, close: 7, low: 2, high: 9),
        .init(open: 5, close: 8, low: 3, high: 10),
        .init(open: 6, close: 9, low: 4, high: 11),
        .init(open: 7, close: 10, low: 5, high: 12),
        .init(open: 8, close: 11, low: 6, high: 13),
        .init(open: 9, close: 12, low: 7, high: 14),
        .init(open: 10, close: 13, low: 8, high: 15),
    ]

    var body: some View {
        Chart {
            ForEach(Array(zip(candles.indices, candles)), id: \.1) { index, candle in
                RectangleMark(
                    x: .value("index", index),
                    yStart: .value("low", candle.low),
                    yEnd: .value("high", candle.high),
                    width: 3
                )

                RectangleMark(
                    x: .value("index", index),
                    yStart: .value("open", candle.open),
                    yEnd: .value("close", candle.close),
                    width: 10
                )
                .foregroundStyle(.green)
            }
        }
        .padding()
    }
}
