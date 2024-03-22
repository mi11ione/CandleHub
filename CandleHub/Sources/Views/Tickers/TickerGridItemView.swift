//
//  TickerGridItemView.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct TickerGridItemView: View {
    var ticker: TickerMOEX
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(ticker.title).font(.title).bold()
                    Text("\(ticker.price)").font(.title3)
                    Text(ticker.priceChange.amount > 0 ? "+\(ticker.priceChange)" : "\(ticker.priceChange)")
                }
                .padding([.leading, .vertical])
                Spacer()
                CandleStickChart()
                    .frame(width: 180)
            }
            .padding()
            .frame(width: 350, height: 160, alignment: .center)
            .background(Rectangle().fill(Material.thin))
            .cornerRadius(30)
            .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}
