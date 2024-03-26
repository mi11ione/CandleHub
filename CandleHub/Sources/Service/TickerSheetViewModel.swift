import Foundation

struct TickerSheetViewModel {
    var ticker: TickerMOEX
    var candles: [Candle]
    var detectedPattern: DetectedPattern
    
    init(
        ticker: TickerMOEX,
        candles: [Candle]
        
    ) {
        self.ticker = ticker
        self.candles = candles
        detectedPattern = DetectionPatterns.detectionPatterns(candles: candles)
    }
    
    
}
