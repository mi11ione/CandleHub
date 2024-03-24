//
//  PatternsView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsView: View {
    @State private var viewModel = PatternsGridViewModel(selectedOption: "Big patterns")

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Patterns")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])

                    Spacer()
                    PatternsViewSwitch(viewModel: $viewModel)
                        .padding(.top, 13)
                }
                Filters()
            }

            PatternsGridView(
                viewModel: $viewModel,
                patterns: [
                    Pattern(
                        name: "Morning Star",
                        candles: [
                            Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 120, closePrice: 108, highPrice: 119, lowPrice: 108.1, value: 0, volume: 0),
                            Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 110, closePrice: 109, highPrice: 115, lowPrice: 101, value: 0, volume: 0),
                            Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 108, closePrice: 120, highPrice: 119, lowPrice: 108.1, value: 0, volume: 0),
                        ],
                        info: "Infoo"
                    ),

                    Pattern(
                        name: "Three white soldiers",
                        candles: [
                            Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 108, closePrice: 120, highPrice: 122, lowPrice: 107.5, value: 0, volume: 0),
                            Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 109, closePrice: 122, highPrice: 125, lowPrice: 109, value: 0, volume: 0),
                            Candle(date: Candle.stringToDate("2016-04-14T13:44:00+0000"), openPrice: 121, closePrice: 130, highPrice: 130, lowPrice: 121, value: 0, volume: 0),
                        ],
                        info: "Infoo"
                    ),

                    Pattern(
                        name: "Hammer",
                        candles: [
                            Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 120, closePrice: 122, highPrice: 122, lowPrice: 110, value: 0, volume: 0),
                        ],
                        info: "Infoo"
                    ),
                ]
            )
        }
    }
}
