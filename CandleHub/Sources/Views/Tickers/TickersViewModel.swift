//
//  TickersViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

class TickersViewModel: ObservableObject {
    @Published var array: [TickerMOEX]?

    init(array: [TickerMOEX]? = nil) {
        self.array = array
    }

    func fetchTickers() {
        Task {
            array = await TradingDataNetworkFetcher().getMoexTickers() ?? []
        }
    }
}
