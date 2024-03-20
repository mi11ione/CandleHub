//
//  Filters.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct Filters: View {
    let filters = [
        ("1 filter", ["1", "2", "3", "4"]),
        ("2 filter", []),
        ("3 filter", []),
        ("4 filter", []),
        ("5 filter", []),
        ("6 filter", []),
        ("7 filter", []),
        ("8 filter", [])]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.0) { filter, options in
                    FilterButton(filter: filter, options: options)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}
