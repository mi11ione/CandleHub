//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("CandleHub")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    Spacer()
                    tickerSwitchButton
                        .padding(.trailing)
                }
                Filters()
                Tickers()
            }
        }
    }
    
    private var tickerSwitchButton: some View {
        Button(action: {
            // todo
        }) {
            Image(systemName: "bolt.horizontal.fill")
                .font(.title)
                .imageScale(.medium)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
        .padding(.top, 10)
    }
}
