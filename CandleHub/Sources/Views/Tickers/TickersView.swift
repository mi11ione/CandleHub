//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
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


struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText: String = ""
    @State private var isRefreshing = false
    @State private var scrollOffset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    @State private var refreshThreshold: CGFloat = 0
    @StateObject var tickersViewModel = TickersViewModel()

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("CandleHub")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    Spacer()
                    TickersViewSwitch()
                }
                SearchBar(checkAmount: $searchText)
                    .padding(.horizontal, 22)
                    .padding(.vertical, -3)
                TickersGridView(tickers: tickersViewModel.array ?? [])
            }.onAppear() {
                tickersViewModel.fetchTickers()
            }
        }
    }
}
