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
            return [GridItem(.adaptive(minimum: 180))]
        }
    }

    func updateLayout(for option: String) {
        switch option {
        case "Big patterns":
            gridWidth = 350.0
        case "Small patterns":
            gridWidth = 160.0
        default:
            break
        }
    }
}
