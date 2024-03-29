import SwiftUI

class PatternsGridViewModel: ObservableObject {
    private let fetcher: TradingDataNetworkFetching
    @Published var patterns: [Pattern] = []

    init(fetcher: TradingDataNetworkFetching) {
        self.fetcher = fetcher
    }

    func fetchPatterns() async {
        if let fetchedPatterns = await fetcher.getPatterns() {
            DispatchQueue.main.async {
                self.patterns = fetchedPatterns
            }
        }
    }

    func fetchDetectedPatterns(candles: [Candle]) async -> [DetectedPattern]? {
        let fetchedArray = await fetcher.getDetectedPatterns(candles: candles)
        return fetchedArray
    }

    func gridWidth(for selectedOption: Option) -> CGFloat {
        switch selectedOption {
        case .bigPatterns: return 350
        case .smallPatterns: return 160
        }
    }
}
