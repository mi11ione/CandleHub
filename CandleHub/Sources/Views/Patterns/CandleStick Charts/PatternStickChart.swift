//
//  PatternStickChart.swift
//  CandleHub
//
//  Created by 1 on 23.03.2024.
//

import Charts
import SwiftUI

struct PatternStickChart: View {
    @Environment(\.colorScheme) var colorScheme
    var pattern: Pattern
    var gridWidth: CGFloat

    var body: some View {
        Chart {
            ForEach(Array(zip(pattern.candles.indices, pattern.candles)), id: \.1.id) { _, candle in
                RectangleMark(
                    x: .value("Time", Candle.formatDateHH(candle.date)),
                    yStart: .value("Low", candle.lowPrice),
                    yEnd: .value("High", candle.highPrice),
                    width: .fixed(2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(colorScheme == .dark ? .white : .black)

                RectangleMark(
                    x: .value("Time", Candle.formatDateHH(candle.date)),
                    yStart: .value("Open", candle.openPrice),
                    yEnd: .value("Close", candle.closePrice),
                    width: .fixed(10)
                )
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .foregroundStyle(candle.openPrice < candle.closePrice ? .green : .red)
            }
        }
        .padding()
        .padding(.leading)
        .frame(width: gridWidth, height: 160)
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic(desiredCount: 6)) {
                AxisGridLine(centered: true)
                AxisValueLabel(centered: true)
            }
        }
        .chartYScale(domain: pattern.calculateYAxisDomain())
        .chartYAxis {
            AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
        }
    }
}
