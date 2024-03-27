import Charts
import SwiftUI

struct PatternStickChart: View {
    @Environment(\.colorScheme) var colorScheme
    var pattern: Pattern
    var gridWidth: CGFloat

    var body: some View {
        Chart {
            ForEach(pattern.candles, id: \.id) { candle in
                RectangleMark(
                    x: .value("Time", Candle.formatDateHH(candle.date)),
                    yStart: .value("Low", candle.lowPrice),
                    yEnd: .value("High", candle.highPrice),
                    width: .fixed(2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)

                RectangleMark(
                    x: .value("Time", Candle.formatDateHH(candle.date)),
                    yStart: .value("Open", candle.openPrice),
                    yEnd: .value("Close", candle.closePrice),
                    width: .fixed(10)
                )
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .foregroundStyle(candle.openPrice < candle.closePrice ? Color.green : Color.red)
            }
        }
        .padding()
        .frame(width: gridWidth, height: 150)
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic(desiredCount: 6)) {
                AxisGridLine(centered: true)
                AxisValueLabel(centered: true)
            }
        }
        .chartYAxis {
            AxisMarks(position: .trailing, values: .automatic(desiredCount: 5))
        }
        .chartYScale(domain: pattern.calculateYAxisDomain())
    }
}
