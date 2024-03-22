//
//  TickersGridView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct TickersGridView: View {
    @Environment(\.colorScheme) var colorScheme

    var tickers: [TickerMOEX]
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 300)),
    ]

    init(tickers: [TickerMOEX]) {
        self.tickers = tickers
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(tickers, id: \.title) { item in
                    VStack {
                        Text("Ticker " + item.title)
                            .frame(width: 350, height: 160, alignment: .center)
                            .background(Rectangle().fill(Material.thin))
                            .cornerRadius(30)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title)
                    }
                }
                .padding(.bottom)
            }
            .padding(.top)
        }
    }
}
