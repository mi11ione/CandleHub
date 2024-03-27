//
//  Filters.swift
//  CandleHub
//
//  Created by mi11ion on 20/3/24.
//

import SwiftUI

struct Filters: View {
    let filters = [
        "Single",
        "Double",
        "Triple",
        "Complex",
    ]

    @Binding var selectedFilter: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    FilterButton(filter: filter, isSelected: .constant(filter == selectedFilter), onSelectionChange: { isSelected in
                        selectedFilter = isSelected ? filter : ""
                    })
                }
                Spacer()
            }
            .padding(.horizontal, 22)
        }
    }
}
