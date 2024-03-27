import SwiftUI

struct TickerSheetViewModel {
    var ticker: TickerMOEX
    var candles: [Candle]
    var detectedPatterns: [DetectedPattern?]

    init(
        ticker: TickerMOEX,
        candles: [Candle]

    ) {
        self.ticker = ticker
        self.candles = candles
        detectedPatterns = DetectionPatterns.detectionPatterns(candles: candles)
    }
    
    func handleDetecionPatterns(candles: [Candle]) -> some View {
        
        var str: String = ""
        let patterns: [DetectedPattern?] = DetectionPatterns.detectionPatterns(candles: candles)
        
        patterns.forEach { detectedPattern in
            if detectedPattern != nil {
                str.append(detectedPattern!.name)
                str.append("\n")
            }
        }
        
        return Text(str)
        
        
    }
    
    func handleGetDatesFromPatterns(pattern: DetectedPattern?) -> [Date]{
        
        var dates: [Date] = []
        
        if let pattern = pattern {
            
            pattern.dates.forEach { date in
                dates.append(date)
            }
        }
        
        return dates
        
    }
    
}
