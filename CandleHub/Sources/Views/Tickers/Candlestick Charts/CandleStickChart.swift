//
//  CandleStickChart.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import Charts
import SwiftUI

struct CandleStickChart: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: CandleStickChartViewModel
    let tickerTitle: String

    var body: some View {
        Chart {
            if let candles = viewModel.candlesByTicker[tickerTitle] {
                ForEach(candles, id: \.id) { candle in
                    RectangleMark(
                        x: .value("Time", viewModel.formatDate(candle.date)),
                        yStart: .value("Low", candle.lowPrice),
                        yEnd: .value("High", candle.highPrice),
                        width: .fixed(2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)

                    RectangleMark(
                        x: .value("Time", viewModel.formatDate(candle.date)),
                        yStart: .value("Open", candle.openPrice),
                        yEnd: .value("Close", candle.closePrice),
                        width: .fixed(7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .foregroundStyle(candle.openPrice < candle.closePrice ? .red : .green)
                }
            }
        }
        .padding()
        .chartYScale(domain: viewModel.calculateYAxisDomain(for: tickerTitle))
        .chartYAxis {
            AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
        }
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic(desiredCount: 5))
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
