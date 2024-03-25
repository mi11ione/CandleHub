//
//  PatternsGridViewModel.swift
//  CandleHub
//
//  Created by mi11ion on 24/3/24.
//

import SwiftUI

struct PatternsGridViewModel {
    func gridWidth(for selectedOption: Option) -> CGFloat {
        switch selectedOption {
        case .bigPatterns:
            350
        case .smallPatterns:
            160
        }
    }

    func adaptiveColumn(for selectedOption: Option) -> [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }
}
