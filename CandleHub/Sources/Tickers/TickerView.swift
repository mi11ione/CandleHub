//
//  TickerView.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct TickerView: View {
    let ticker: Ticker

    var body: some View {
        NavigationLink(value: ticker) {
            HStack {
                Image(ticker.tickerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66)
                    .clipped()
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    Text(ticker.tickerTitle).font(.headline)
                    Text(ticker.tickerPrice).font(.footnote)
                    Text(ticker.tickerImage).font(.subheadline).frame(maxHeight: 60)
                }
                Spacer()
            }
            .padding(.vertical, 5)
        }
        .navigationDestination(for: Ticker.self) { selectedTicker in
            DetailedTickerView(ticker: selectedTicker)
        }
    }
}
