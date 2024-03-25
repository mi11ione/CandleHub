//
//  PatternsRepository.swift
//  CandleHub
//
//  Created by mi11ion on 25/3/24.
//

import Foundation

enum PatternsRepository {
    static let patterns = [
        Pattern(
            name: "Morning Star",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 120, closePrice: 108, highPrice: 119, lowPrice: 108.1, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 110, closePrice: 109, highPrice: 115, lowPrice: 101, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 108, closePrice: 120, highPrice: 119, lowPrice: 108.1, value: 0, volume: 0),
            ],
            info: "Паттерн Утренняя звезда состоит из 3 свечей. Одна свеча с коротким телом между длинной красной и длинной зеленой. Маленькая свеча в середине может быть зеленой или красной. Утренняя звезда показывает, что давление продаж снижается ситуация переходит в руки быков. Если объем третьей свечи высокий, паттерн подтверждается и это считается сильным разворотом тренда и хорошим сигналом покупки.",
            filter: ""
        ),
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
            name: "Hammer",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 120, closePrice: 122, highPrice: 122, lowPrice: 110, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Evening Star",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-15T10:44:00+0000"), openPrice: 130, closePrice: 118, highPrice: 132, lowPrice: 117, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-15T11:44:00+0000"), openPrice: 119, closePrice: 120, highPrice: 121, lowPrice: 118, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-15T12:44:00+0000"), openPrice: 120, closePrice: 110, highPrice: 121, lowPrice: 109, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Bullish Engulfing",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-16T10:44:00+0000"), openPrice: 110, closePrice: 108, highPrice: 112, lowPrice: 107, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-16T11:44:00+0000"), openPrice: 108, closePrice: 112, highPrice: 113, lowPrice: 108, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Bearish Engulfing",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-17T10:44:00+0000"), openPrice: 120, closePrice: 122, highPrice: 123, lowPrice: 119, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-17T11:44:00+0000"), openPrice: 122, closePrice: 118, highPrice: 122, lowPrice: 117, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Piercing Line",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-18T10:44:00+0000"), openPrice: 105, closePrice: 95, highPrice: 106, lowPrice: 94, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-18T11:44:00+0000"), openPrice: 94, closePrice: 104, highPrice: 105, lowPrice: 93, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Hanging Man",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-19T10:44:00+0000"), openPrice: 130, closePrice: 128, highPrice: 131, lowPrice: 125, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Shooting Star",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-20T10:44:00+0000"), openPrice: 150, closePrice: 147, highPrice: 155, lowPrice: 146, value: 0, volume: 0),
            ],
            info: "Info",
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
            name: "Bullish Harami",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-22T10:44:00+0000"), openPrice: 95, closePrice: 100, highPrice: 101, lowPrice: 94, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-22T11:44:00+0000"), openPrice: 100, closePrice: 105, highPrice: 106, lowPrice: 99, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Bearish Harami",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-23T10:44:00+0000"), openPrice: 110, closePrice: 115, highPrice: 116, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-23T11:44:00+0000"), openPrice: 115, closePrice: 110, highPrice: 116, lowPrice: 109, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Dark Cloud Cover",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-24T10:44:00+0000"), openPrice: 120, closePrice: 125, highPrice: 126, lowPrice: 119, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-24T11:44:00+0000"), openPrice: 126, closePrice: 119, highPrice: 127, lowPrice: 118, value: 0, volume: 0),
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
            name: "Dragonfly Doji",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-26T10:44:00+0000"), openPrice: 100, closePrice: 100, highPrice: 100, lowPrice: 90, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Gravestone Doji",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-27T10:44:00+0000"), openPrice: 100, closePrice: 100, highPrice: 110, lowPrice: 100, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Long-legged Doji",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-28T10:44:00+0000"), openPrice: 105, closePrice: 105, highPrice: 115, lowPrice: 95, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Tweezer Tops",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-29T10:44:00+0000"), openPrice: 120, closePrice: 110, highPrice: 121, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-29T11:44:00+0000"), openPrice: 110, closePrice: 100, highPrice: 121, lowPrice: 99, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Tweezer Bottoms",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-30T10:44:00+0000"), openPrice: 100, closePrice: 110, highPrice: 111, lowPrice: 100, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-30T11:44:00+0000"), openPrice: 110, closePrice: 120, highPrice: 121, lowPrice: 110, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Three Black Crows",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-01T10:44:00+0000"), openPrice: 130, closePrice: 120, highPrice: 131, lowPrice: 119, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-01T11:44:00+0000"), openPrice: 120, closePrice: 110, highPrice: 121, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-01T12:44:00+0000"), openPrice: 110, closePrice: 100, highPrice: 111, lowPrice: 99, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Abandoned Baby",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-03T10:44:00+0000"), openPrice: 100, closePrice: 90, highPrice: 101, lowPrice: 89, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-03T11:44:00+0000"), openPrice: 80, closePrice: 80, highPrice: 85, lowPrice: 75, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-03T12:44:00+0000"), openPrice: 90, closePrice: 100, highPrice: 101, lowPrice: 89, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Flags and Pennants",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-06T10:44:00+0000"), openPrice: 100, closePrice: 105, highPrice: 106, lowPrice: 99, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-06T11:44:00+0000"), openPrice: 105, closePrice: 104, highPrice: 106, lowPrice: 103, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-06T12:44:00+0000"), openPrice: 104, closePrice: 107, highPrice: 108, lowPrice: 103, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Rising Three Methods",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-10T10:44:00+0000"), openPrice: 100, closePrice: 110, highPrice: 111, lowPrice: 99, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-10T11:44:00+0000"), openPrice: 111, closePrice: 109, highPrice: 112, lowPrice: 108, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-10T12:44:00+0000"), openPrice: 109, closePrice: 108, highPrice: 110, lowPrice: 107, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-10T13:44:00+0000"), openPrice: 108, closePrice: 107, highPrice: 109, lowPrice: 106, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-10T14:44:00+0000"), openPrice: 107, closePrice: 115, highPrice: 116, lowPrice: 106, value: 0, volume: 0),
            ],
            info: "Info",
            filter: ""
        ),
        Pattern(
            name: "Falling Three Methods",
            candles: [
                Candle(date: Candle.stringToDate("2016-05-14T10:44:00+0000"), openPrice: 120, closePrice: 110, highPrice: 121, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-14T11:44:00+0000"), openPrice: 109, closePrice: 111, highPrice: 112, lowPrice: 108, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-14T12:44:00+0000"), openPrice: 111, closePrice: 112, highPrice: 113, lowPrice: 110, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-14T13:44:00+0000"), openPrice: 112, closePrice: 113, highPrice: 114, lowPrice: 111, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-05-14T14:44:00+0000"), openPrice: 113, closePrice: 105, highPrice: 114, lowPrice: 104, value: 0, volume: 0),
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
            name: "Bearish evening star",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 250, closePrice: 240, highPrice: 250, lowPrice: 240, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 230, highPrice: 245, lowPrice: 230, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 240, closePrice: 220, highPrice: 240, lowPrice: 220, value: 0, volume: 0),
            ],
            info: "Вечерняя звезда состоит из 3 свечей. Одна свеча с коротким телом между длинной зеленой и длинной красной. Маленькая свеча в середине может быть зеленой или красной. Вечерняя звезда показывает, что давление продаж увеличивается и ситуация переходит в руки медведей. Если объем третьей свечи высокий, паттерн подтверждается, и это считается сильным разворотом тренда и хорошим сигналом для продажи.",
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
