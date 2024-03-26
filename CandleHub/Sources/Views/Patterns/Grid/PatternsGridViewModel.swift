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
