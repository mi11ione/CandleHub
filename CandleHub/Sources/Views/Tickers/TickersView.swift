//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText: String = ""
    @Binding var viewModel: TickersViewModel
    @FocusState private var isTextFieldFocused: Bool

    private var filteredTickers: [TickerMOEX] {
        guard let tickers = viewModel.array else { return [] }
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

                if viewModel.isLoading {
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
                let (fetchedArray, newLoadingState) = await viewModel.fetchTickers()
                viewModel.array = fetchedArray
                viewModel.isLoading = newLoadingState
            }
        }
    }
}
