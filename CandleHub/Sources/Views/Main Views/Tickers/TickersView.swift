//
//  TickersView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText: String = ""
    @State private var isRefreshing = false
    @State private var scrollOffset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    @State private var refreshThreshold: CGFloat = 0

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
                SearchBar(checkAmount: $searchText)
                    .padding(.horizontal, 22)
                    .padding(.vertical, -3)
                TickersGridView()
            }
        }
    }
}

#Preview {
    ContentView()
}
