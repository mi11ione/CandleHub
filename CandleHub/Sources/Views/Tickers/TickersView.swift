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
    @ObservedObject var tickersViewModel: TickersViewModel

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

                if tickersViewModel.isLoading == false {
                    TickersGridView(tickers: tickersViewModel.array ?? [])
                } else {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding(.top, 50)
                    Spacer()
                }
            }
            .onAppear {
                tickersViewModel.fetchTickers()
            }
        }
    }
}
