//
//  TickersViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct TickersViewModel {
    var isLoading: Bool
    var array: [TickerMOEX]?
    private let fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching, array: [TickerMOEX]? = nil, isLoading: Bool = true) {
        self.fetcher = fetcher
        self.array = array
        self.isLoading = isLoading
    }

    func fetchTickers(forceRefresh: Bool = false) async -> ([TickerMOEX]?, Bool) {
        if array == nil || forceRefresh {
            let fetchedArray = await fetcher.getMoexTickers()
            return (fetchedArray, false)
        }
        return (array, false)
    }
}
