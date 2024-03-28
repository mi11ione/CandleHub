import SwiftUI

struct CandlesViewModel {
    let ticker: TickerMOEX
    let tickerTitle: String
    var candles: [Candle] = []
//    var detectedPatterns: [DetectedPattern] = []
    private var fetcher: TradingDataNetworkFetching

    init(
        ticker: TickerMOEX,
        tickerTitle: String,
        fetcher: TradingDataNetworkFetching
    ) {
        self.ticker = ticker
        self.tickerTitle = tickerTitle
        self.fetcher = fetcher
    }

    mutating func fetchData(numberOfCandles: Int = 10) async {
        guard let fetchedCandles = await fetcher.getMoexCandles(
            ticker: tickerTitle,
            timePeriod: .hour
        )
        else {
            return
        }
        candles = Array(fetchedCandles.suffix(numberOfCandles))
    }
}
