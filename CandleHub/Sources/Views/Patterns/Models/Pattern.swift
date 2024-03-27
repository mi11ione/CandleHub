import Foundation

struct Pattern: Hashable, Identifiable {
    static func == (lhs: Pattern, rhs: Pattern) -> Bool {
        lhs.name == rhs.name &&
        lhs.candles == rhs.candles &&
        lhs.info == rhs.info &&
        lhs.filter == rhs.filter
    }

    let id = UUID()
    let name: String
    let candles: [Candle]
    let info: String
    let filter: String

    func calculateYAxisDomain() -> ClosedRange<Double> {
        let lowPrices = candles.map(\.lowPrice)
        let highPrices = candles.map(\.highPrice)
        guard let minPrice = lowPrices.min(), let maxPrice = highPrices.max() else {
            return 0 ... 100
        }
        let padding = (maxPrice - minPrice) * 0.15
        return (minPrice - padding) ... (maxPrice + padding)
    }
}
