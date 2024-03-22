//
//  TickersViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

class TickersViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var array: [TickerMOEX]?

    init(array: [TickerMOEX]? = nil) {
        self.array = array
    }

    func fetchTickers(forceRefresh: Bool = false) {
        isLoading = true

        Task {
            if array == nil || forceRefresh {
                let fetchedArray = await TradingDataNetworkFetcher().getMoexTickers()

                await MainActor.run {
                    self.array = fetchedArray ?? []
                    self.isLoading = false
                }
            } else {
                await MainActor.run {
                    self.isLoading = false
                }
            }
        }
    }
}
