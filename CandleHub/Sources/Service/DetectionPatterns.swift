import SwiftUI

enum DetectionPatterns {
    static func detectionPatterns(candles: [Candle]) -> DetectedPattern {
        findTwoCrows(candles: candles)
    }
}

struct DetectedPattern {
    var name: String
    var signal: [Signal]
    var dates: [Date]
}

enum Signal {
    case buy
    case sell
}
