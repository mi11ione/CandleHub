import Charts
import SwiftUI

struct CandleStickChart: View {
    @Environment(\.colorScheme) var colorScheme
    let candles: [Candle]
    let tickerTitle: String
    let numberOfCandles: Int
    let patternCandlesDates: [Date]

    public init(
        candles: [Candle],
        tickerTitle: String,
        numberOfCandles: Int = 10,
        patternCandlesDates: [Date]
    ) {
        self.candles = candles
        self.tickerTitle = tickerTitle
        self.numberOfCandles = numberOfCandles
        self.patternCandlesDates = patternCandlesDates
    }

    var body: some View {
        Chart {
            ForEach(candles.indices, id: \.self) { index in
                let candle = candles[index]
                let isPredicted = index == candles.count - 1

                RectangleMark(
                    x: .value("Time", formatDate(candle.date)),
                    yStart: .value("Low", candle.lowPrice),
                    yEnd: .value("High", candle.highPrice),
                    width: .fixed(2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(colorScheme == .dark ? .white : .black)

                RectangleMark(
                    x: .value("Time", formatDate(candle.date)),
                    yStart: .value("Open", candle.openPrice),
                    yEnd: .value("Close", candle.closePrice),
                    width: .fixed(isPredicted ? 12 : 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .foregroundStyle(isPredicted ? (candle.openPrice < candle.closePrice ? Color.red.opacity(0.5) : Color.green.opacity(0.5)) : (candle.openPrice < candle.closePrice ? .red : .green))

                if patternCandlesDates.contains(candle.date) {
                    let domain = calculateYAxisDomain(for: candles)
                    let delta = domain.upperBound - domain.lowerBound
                    RectangleMark(
                        x: .value("Time", formatDate(candle.date)),
                        yStart: .value("Low", candle.lowPrice - delta * 0.05),
                        yEnd: .value("High", candle.highPrice + delta * 0.05),
                        width: .fixed(20)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(colorScheme == .dark ? .orange : .orange)
                    .opacity(0.2)
                    
                }
            }
        }
        .padding(.leading)
        .chartYScale(domain: calculateYAxisDomain(for: candles))
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
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

    private func calculateYAxisDomain(for candles: [Candle]) -> ClosedRange<Double> {
        guard !candles.isEmpty else {
            return 0 ... 100
        }
        let lowPrices = candles.map(\.lowPrice)
        let highPrices = candles.map(\.highPrice)
        guard let minPrice = lowPrices.min(), let maxPrice = highPrices.max() else {
            return 0 ... 100
        }
        let padding = (maxPrice - minPrice) * 0.15
        return (minPrice - padding) ... (maxPrice + padding)
    }
}
