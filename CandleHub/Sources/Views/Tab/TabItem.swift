//
//  TabItem.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Candles", icon: "alternatingcurrent", color: .teal, selection: .candles),
    TabItem(name: "Tickers", icon: "dollarsign.arrow.circlepath", color: .red, selection: .tickers),
    TabItem(name: "Settings", icon: "checkmark.shield.fill", color: .blue, selection: .settings)
]
