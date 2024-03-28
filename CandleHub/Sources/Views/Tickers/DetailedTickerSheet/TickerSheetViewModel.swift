import SwiftUI

struct TickerSheetViewModel {
    var ticker: TickerMOEX
    var candles: [Candle]
    var detectedPatterns: [DetectedPattern?] = []

    private let fetcher: TradingDataNetworkFetching

    init(
        fetcher: TradingDataNetworkFetching,
        ticker: TickerMOEX,
        candles: [Candle]

    ) {
        self.fetcher = fetcher
        self.ticker = ticker
        self.candles = candles
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

    mutating func fetchData(numberOfCandles _: Int = 10) async {
        guard let fetchedPatterns = await fetcher.getDetectedPatterns(candles: candles)
        else {
            return
        }

        detectedPatterns = fetchedPatterns
    }
}
