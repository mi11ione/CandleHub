//
//  TickerView.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct TickerView: View {
    let ticker: TickerMOEX

    var body: some View {
        NavigationLink(value: ticker) {
            HStack {
                Image(ticker.tickerImage ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66)
                    .clipped()
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    Text(ticker.title).font(.headline)
                    Text(ticker.price.description).font(.footnote)
                    Text(ticker.subTitle).font(.subheadline).frame(maxHeight: 60)
                }
                Spacer()
            }
            .padding(.vertical, 5)
        }
        .navigationDestination(for: TickerMOEX.self) { selectedTicker in
            DetailedTickerView(ticker: selectedTicker)
        }
    }
}
