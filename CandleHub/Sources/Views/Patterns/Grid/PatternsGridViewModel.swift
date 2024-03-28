import SwiftUI

struct PatternsGridViewModel {
    private let fetcher: TradingDataNetworkFetching

    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }

    func fetchPatterns() async -> [Pattern]? {
        let fetchedArray = await fetcher.getPatterns()
        return fetchedArray
    }

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
