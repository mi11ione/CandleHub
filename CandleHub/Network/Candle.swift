import Foundation

public struct Candle: Identifiable {
    public var id = UUID()
    public var date: Date
    public var openPrice: Double
    public var closePrice: Double
    public var highPrice: Double
    public var lowPrice: Double
    public var value: Double
    public var volume: Double

    public init(
        date: Date,
        openPrice: Double,
        closePrice: Double,
        highPrice: Double,
        lowPrice: Double,
        value: Double,
        volume: Double
    ) {
        self.date = date
        self.openPrice = openPrice
        self.closePrice = closePrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.value = value
        self.volume = volume
    }

    public init(
        date: String,
        openPrice: Double,
        closePrice: Double,
        highPrice: Double,
        lowPrice: Double,
        value: Double,
        volume: Double
    ) {
        self.date = Date(timeIntervalSinceNow: 0)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.date = dateFormatter.date(from: date) ?? Date(timeIntervalSinceNow: 0)
        self.openPrice = openPrice
        self.closePrice = closePrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.value = value
        self.volume = volume
    }
}

private let minPriceDefaultValue = 0.0
private let maxPriceDefaultValue = 1000.0
extension Candle {
    static func candlesMinPriceValue(_ candles: [Candle]) -> Double {
        candles.min(by: { $0.lowPrice < $1.lowPrice })?.lowPrice ?? minPriceDefaultValue
    }

    static func candlesMaxPriceValue(_ candles: [Candle]) -> Double {
        candles.max(by: { $0.highPrice < $1.highPrice })?.highPrice ?? maxPriceDefaultValue
    }
}
