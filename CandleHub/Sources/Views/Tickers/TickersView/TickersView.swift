//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var searchText: String = ""
    @FocusState var isTextFieldFocused: Bool
    @State var isLoading: Bool = false
    @State var array: [TickerMOEX]? = nil
    let fetcher: TradingDataNetworkFetching

    private var filteredTickers: [TickerMOEX] {
        guard let tickers = array else { return [] }
        if searchText.isEmpty {
            return tickers
        } else {
            return tickers.filter { ticker in
                ticker.title.lowercased().contains(searchText.lowercased()) ||
                    ticker.subTitle.lowercased().contains(searchText.lowercased())
            }
        }
    }

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

                if isLoading {
                    Spacer()
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                    Spacer()
                } else {
                    ScrollView {
                        SearchBar(checkAmount: $searchText)
                            .focused($isTextFieldFocused)
                            .padding(.horizontal, 22)

                        TickersGridView(tickers: filteredTickers)
                    }
                }
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
        .onAppear {
            Task {
                let (fetchedArray, newLoadingState) = await fetchTickers()
                array = fetchedArray
                isLoading = newLoadingState
            }
        }
    }
    func fetchTickers(forceRefresh: Bool = false) async -> ([TickerMOEX]?, Bool) {
        if array == nil || forceRefresh {
            let fetchedArray = await fetcher.getMoexTickers()
            return (fetchedArray, false)
        }
        return (array, false)
    }
}
