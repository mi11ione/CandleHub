import SwiftUI

struct TickerSheetViewModel {
    var ticker: TickerMOEX
    var candles: [Candle]
    var detectedPatterns: [DetectedPattern?]

    init(
        ticker: TickerMOEX,
        candles: [Candle]

    ) {
        self.ticker = ticker
        self.candles = candles
        detectedPatterns = DetectionPatterns.detectionPatterns(candles: candles)
    }

    func handleDetecionPatterns(candles: [Candle]) -> some View {
        var str = ""
        let patterns: [DetectedPattern?] = DetectionPatterns.detectionPatterns(candles: candles)

        for detectedPattern in patterns {
            if detectedPattern != nil {
                str.append(detectedPattern!.name)
                str.append("\n")
            }
        }

        return Text(str)
    }

    func handleGetDatesFromPatterns(pattern: DetectedPattern?) -> [Date] {
        var dates: [Date] = []

        if let pattern = pattern {
            for date in pattern.dates {
                dates.append(date)
            }
        }

        return dates
    }
}
