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
    @State var viewModel: CandleStickChartViewModel
    let tickerTitle: String

    public init(viewModel: CandleStickChartViewModel, tickerTitle: String) {
        self.viewModel = viewModel
        self.tickerTitle = tickerTitle
    }

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
        .padding(.leading)
        .chartYScale(domain: viewModel.calculateYAxisDomain(for: tickerTitle))
        .chartYAxis {
            AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour, count: 3)) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    switch hour {
                    case 0, 12:
                        AxisValueLabel(format: .dateTime.hour())
                    default:
                        AxisValueLabel(format: .dateTime.hour(.defaultDigits(amPM: .omitted)))
                    }

                    AxisGridLine()
                    AxisTick()
                }
            }
        }
        .onAppear {
            Task {
                if let data = await viewModel.fetchData(ticker: tickerTitle) {
                    viewModel.candlesByTicker[tickerTitle] = data
                }
            }
        }
    }
}
