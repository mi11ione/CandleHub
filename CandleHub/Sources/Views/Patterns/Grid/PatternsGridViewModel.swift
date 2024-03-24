//
//  PatternsGridViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 24/3/24.
//

import SwiftUI

struct PatternsGridViewModel {
    func gridWidth(for selectedOption: String) -> CGFloat {
        selectedOption == "Big patterns" ? 350 : 160
    }

    func adaptiveColumn(for selectedOption: String) -> [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }
}
