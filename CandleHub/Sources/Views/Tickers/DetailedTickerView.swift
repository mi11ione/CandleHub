//
//  DetailedTickerView.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct DetailedTickerView: View {
    var ticker: TickerMOEX
    var body: some View {
        Text(ticker.title)
    }
}