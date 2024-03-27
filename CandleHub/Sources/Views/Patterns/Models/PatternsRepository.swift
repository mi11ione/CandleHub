import Foundation

enum PatternsRepository {
    static let patterns = [
        Pattern(
            name: "Three white soldiers",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 108, closePrice: 120, highPrice: 122, lowPrice: 107.5, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 109, closePrice: 122, highPrice: 125, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T13:44:00+0000"), openPrice: 121, closePrice: 130, highPrice: 130, lowPrice: 121, value: 0, volume: 0),
            ],
            info: "",
            filter: "Triple"
        ),
        Pattern(
            name: "Inverted Hammer",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-21T10:44:00+0000"), openPrice: 100, closePrice: 102, highPrice: 107, lowPrice: 99, value: 0, volume: 0),
            ],
            info: "Info",
            filter: "Single"
        ),
        Pattern(
            name: "Doji",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-25T10:44:00+0000"), openPrice: 105, closePrice: 105, highPrice: 110, lowPrice: 100, value: 0, volume: 0),
            ],
            info: "Info",
            filter: "Single"
        ),
        Pattern(
            name: "Closing Marubozu",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 260, closePrice: 220, highPrice: 260, lowPrice: 220, value: 0, volume: 0)
            ],
            info: "",
            filter: "Single"
        ),
        Pattern(
            name: "Gartley Pattern",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-18T10:44:00+0000"), openPrice: 100, closePrice: 105, highPrice: 106, lowPrice: 99, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-18T11:44:00+0000"), openPrice: 105, closePrice: 95, highPrice: 106, lowPrice: 94, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-18T12:44:00+0000"), openPrice: 95, closePrice: 100, highPrice: 101, lowPrice: 94, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-18T13:44:00+0000"), openPrice: 100, closePrice: 90, highPrice: 101, lowPrice: 89, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-18T14:44:00+0000"), openPrice: 90, closePrice: 95, highPrice: 96, lowPrice: 89, value: 0, volume: 0),
            ],
            info: "Info",
            filter: "Complex"
        ),
        Pattern(
            name: "Head and Shoulders",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-23T11:44:00+0000"), openPrice: 100, closePrice: 110, highPrice: 111, lowPrice: 99, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-23T12:44:00+0000"), openPrice: 110, closePrice: 120, highPrice: 121, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-23T13:44:00+0000"), openPrice: 120, closePrice: 115, highPrice: 122, lowPrice: 114, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-23T14:44:00+0000"), openPrice: 115, closePrice: 105, highPrice: 116, lowPrice: 104, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-23T15:44:00+0000"), openPrice: 105, closePrice: 110, highPrice: 111, lowPrice: 104, value: 0, volume: 0),
            ],
            info: "Info",
            filter: "Complex"
        ),
        Pattern(
            name: "Engulfing",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 230, highPrice: 230, lowPrice: 210, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 235, closePrice: 215, highPrice: 240, lowPrice: 215, value: 0, volume: 0)
            ],
            info: "",
            filter: "Double"
        ),
        Pattern(
            name: "Three black crows",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 260, highPrice: 260, lowPrice: 220, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 250, highPrice: 260, lowPrice: 235, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 260, closePrice: 200, highPrice: 260, lowPrice: 190, value: 0, volume: 0),
            ],
            info: "",
            filter: "Triple"
        ),
        Pattern(
            name: "Abandoned Baby",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 200, highPrice: 225, lowPrice: 195, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 190, closePrice: 190, highPrice: 195, lowPrice: 185, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 210, closePrice: 230, highPrice: 235, lowPrice: 205, value: 0, volume: 0)
            ],
            info: "",
            filter: "Triple"
        ),
        Pattern(
            name: "Breakaway",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 200, closePrice: 220, highPrice: 225, lowPrice: 195, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 220, closePrice: 215, highPrice: 230, lowPrice: 210, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 215, closePrice: 235, highPrice: 240, lowPrice: 215, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T13:44:00+0000"), openPrice: 240, closePrice: 250, highPrice: 255, lowPrice: 240, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T14:44:00+0000"), openPrice: 255, closePrice: 245, highPrice: 260, lowPrice: 240, value: 0, volume: 0)
            ],
            info: "",
            filter: "Complex"
        ),
        Pattern(
            name: "Harami",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 250, closePrice: 200, highPrice: 260, lowPrice: 195, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 210, closePrice: 230, highPrice: 235, lowPrice: 205, value: 0, volume: 0)
            ],
            info: "",
            filter: "Double"
        ),
        Pattern(
            name: "Piercing Line",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 250, closePrice: 200, highPrice: 255, lowPrice: 195, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 190, closePrice: 240, highPrice: 245, lowPrice: 185, value: 0, volume: 0)
            ],
            info: "",
            filter: ""
        ),
    ]
}
