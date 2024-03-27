import SwiftUI

struct TickersViewModel {
    var isLoading: Bool
    var tickers: [TickerMOEX]?
    private let fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching, array: [TickerMOEX]? = nil, isLoading: Bool = true) {
        self.fetcher = fetcher
        tickers = array
        self.isLoading = isLoading
    }

    func fetchTickers(forceRefresh: Bool = false) async -> ([TickerMOEX]?, Bool) {
        if tickers == nil || forceRefresh {
            let fetchedArray = await fetcher.getMoexTickers()
            return (fetchedArray, false)
        }
        return (tickers, false)
    }
}
