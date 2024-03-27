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
            info: "Этот паттерн состоит из 3 длинных зеленых свечей, и каждая из них закрывается выше. Когда это возникает внизу нисходящего тренда, и каждая свеча закрывается близко к верху (нет большой верхней тени), это считается сильным сигналом разворота.",
            filter: ""
        ),
        Pattern(
            name: "Inverted Hammer",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-21T10:44:00+0000"), openPrice: 100, closePrice: 102, highPrice: 107, lowPrice: 99, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Doji",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-25T10:44:00+0000"), openPrice: 105, closePrice: 105, highPrice: 110, lowPrice: 100, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
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
            filter: ""
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
            filter: ""
        ),
        Pattern(
            name: "Three black crows",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 260, highPrice: 260, lowPrice: 220, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 250, highPrice: 260, lowPrice: 235, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 260, closePrice: 200, highPrice: 260, lowPrice: 190, value: 0, volume: 0),
            ],
            info: "Этот паттерн состоит из 3 длинных красных свечей, и каждая из них закрывается ниже. Когда это возникает вверху восходящего тренда, и каждая свеча закрывается близко к низу (нет большой нижней тени), это считается сильным сигналом разворота от бычьего к медвежьему рынку.",
            filter: ""
        ),
    ]
}
