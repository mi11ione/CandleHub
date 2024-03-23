//
//  CandleStickChart.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import Charts
import SwiftUI

struct CandleStickChart: View {
    @ObservedObject var viewModel: CandleStickChartViewModel

    var body: some View {
        Chart {
            ForEach(Array(zip(viewModel.candles.indices, viewModel.candles)), id: \.1.id) { _, candle in
                RectangleMark(
                    x: .value("Time", viewModel.formatDate(candle.date)),
                    yStart: .value("Low", candle.lowPrice),
                    yEnd: .value("High", candle.highPrice),
                    width: .fixed(2)
                )
                .foregroundStyle(.secondary)

                RectangleMark(
                    x: .value("Time", viewModel.formatDate(candle.date)),
                    yStart: .value("Open", candle.openPrice),
                    yEnd: .value("Close", candle.closePrice),
                    width: .fixed(10)
                )
                .foregroundStyle(candle.openPrice < candle.closePrice ? .green : .red)
            }
        }
        .padding()
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic(desiredCount: 6)) {
                AxisGridLine(centered: true)
                AxisValueLabel(centered: true)
            }
        }
        .chartYScale(domain: 90 ... 110)
        .chartYAxis {
            AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
