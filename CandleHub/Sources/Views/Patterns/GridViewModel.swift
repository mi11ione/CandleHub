//
//  GridViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 22/3/24.
//

import SwiftUI

struct GridViewModel {
    var selectedOption: String

    var gridWidth: CGFloat {
        selectedOption == "Big patterns" ? 350 : 160
    }

    var adaptiveColumn: [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth))]
    }
}
