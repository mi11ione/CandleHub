//
//  TickerGridItemView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct TickerGridItemView: View {
    let ticker: TickerMOEX
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            tickerInformation
                .padding()
                .frame(width: 350, height: 150, alignment: .center)
                .background(backgroundRectangle)
                .cornerRadius(30)
                .foregroundColor(textColor)
        }
    }

    private var tickerInformation: some View {
        HStack {
            tickerDetails
            Spacer()
            CandleStickChart(viewModel: CandleStickChartViewModel(fetcher: TradingDataNetworkFetcher()), tickerTitle: ticker.title)
                .frame(width: 170)
        }
    }

    private var tickerDetails: some View {
        VStack(alignment: .leading) {
            Text(ticker.subTitle)
                .font(.title3)
                .bold()
                .padding(.trailing, -3)
            Text("$\(ticker.title)\n")
            priceView
            priceChangeView
        }
        .padding(.leading, 8)
    }

    private var priceView: some View {
        Text("\(ticker.price.description)")
            .font(.title3)
            .bold()
    }

    private var priceChangeView: some View {
        Text(priceChangeText)
            .foregroundColor(priceChangeColor)
    }

    private var backgroundRectangle: some View {
        Rectangle().fill(Material.thin)
    }

    private var textColor: Color {
        colorScheme == .dark ? .white : .black
    }

    private var priceChangeText: String {
        ticker.priceChange.amount > 0 ? "+\(ticker.priceChange)" : "\(ticker.priceChange)"
    }

    private var priceChangeColor: Color {
        if ticker.priceChange.amount > 0 {
            return .green
        } else if ticker.priceChange.amount < 0 {
            return .red
        } else {
            return .primary
        }
    }
}
