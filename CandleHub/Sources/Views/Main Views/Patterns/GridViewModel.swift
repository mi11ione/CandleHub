//
//  GridViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

class GridViewModel: ObservableObject {
    @Published var gridWidth: CGFloat = 350.0
    var adaptiveColumn: [GridItem] {
        if gridWidth == 350.0 {
            return [GridItem(.adaptive(minimum: 300))]
        } else {
            return [GridItem(.adaptive(minimum: 160))]
        }
    }

    func updateLayout(for option: String) {
        switch option {
        case "1 Column":
            gridWidth = 350.0
        case "2 Columns":
            gridWidth = 160.0
        default:
            break
        }
    }
}
