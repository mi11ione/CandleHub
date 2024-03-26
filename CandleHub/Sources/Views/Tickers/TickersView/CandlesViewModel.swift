import SwiftUI

struct CandlesViewModel {
    var candles: [Candle] = []
    private var fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }

    mutating func fetchData(ticker: String, numberOfCandles: Int = 10) async {
        guard let fetchedCandles = await fetcher.getMoexCandles(ticker: ticker, timePeriod: .hour) else {
            return
        }
        candles = Array(fetchedCandles.suffix(numberOfCandles))
    }
}
