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
    let numberOfCandles: Int

    public init(viewModel: CandleStickChartViewModel, tickerTitle: String, numberOfCandles: Int = 10) {
        self.viewModel = viewModel
        self.tickerTitle = tickerTitle
        self.numberOfCandles = numberOfCandles
    }

    var body: some View {
        Chart {
            if let candles = viewModel.candlesByTicker[tickerTitle] {
                ForEach(candles.indices, id: \.self) { index in
                    let candle = candles[index]
                    let isPredicted = index == candles.count - 1

                    RectangleMark(
                        x: .value("Time", viewModel.formatDate(candle.date)),
                        yStart: .value("Low", candle.lowPrice),
                        yEnd: .value("High", candle.highPrice),
                        width: .fixed(isPredicted ? 4 : 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)

                    RectangleMark(
                        x: .value("Time", viewModel.formatDate(candle.date)),
                        yStart: .value("Open", candle.openPrice),
                        yEnd: .value("Close", candle.closePrice),
                        width: .fixed(isPredicted ? 12 : 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .foregroundStyle(isPredicted ? (candle.openPrice < candle.closePrice ? Color.red.opacity(0.5) : Color.green.opacity(0.5)) : (candle.openPrice < candle.closePrice ? .red : .green))
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
                if let data = await viewModel.fetchData(ticker: tickerTitle, numberOfCandles: numberOfCandles) {
                    viewModel.candlesByTicker[tickerTitle] = data
                    viewModel.addPredictedCandle(for: tickerTitle)
                }
            }
        }
    }
}
