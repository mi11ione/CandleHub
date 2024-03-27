import Foundation

struct PatternFromBack: Decodable {
    let name: String
    let info: String
    let candles: [Pattern]

    struct Pattern: Decodable {
        let closePrice: Double
        let highPrice: Double
        let lowPrice: Double
        let openPrice: Double
        let volume: Double
        let value: Double
        let date: String
    }
}
