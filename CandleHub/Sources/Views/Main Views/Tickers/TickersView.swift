//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

class TickersArray: ObservableObject {
    init(array: [TickerMOEX]? = nil) {
        self.array = array
    }
    @Published var array: [TickerMOEX]?
}

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var tickersArray: TickersArray
    
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
                Filters()
                Tickers(tickers: tickersArray.array ?? [])
            }.onAppear() {
                Task {
                    tickersArray.array = await TradingDataNetworkFetcher().getMoexTickers() ?? []
                }
            }
        }
    }
}
