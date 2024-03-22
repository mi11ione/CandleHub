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
                TickersGridView(tickers: tickersViewModel.array ?? [])
            }.onAppear {
                tickersViewModel.fetchTickers()
            }
        }
    }
}

#Preview {
    ContentView()
}
