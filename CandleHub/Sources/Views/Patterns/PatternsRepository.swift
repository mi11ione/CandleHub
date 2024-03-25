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
            info: "Паттерн Утренняя звезда состоит из 3 свечей. Одна свеча с коротким телом между длинной красной и длинной зеленой. Маленькая свеча в середине может быть зеленой или красной. Утренняя звезда показывает, что давление продаж снижается ситуация переходит в руки быков. Если объем третьей свечи высокий, паттерн подтверждается и это считается сильным разворотом тренда и хорошим сигналом покупки."
        ),
        Pattern(
            name: "Three white soldiers",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 108, closePrice: 120, highPrice: 122, lowPrice: 107.5, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 109, closePrice: 122, highPrice: 125, lowPrice: 109, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T13:44:00+0000"), openPrice: 121, closePrice: 130, highPrice: 130, lowPrice: 121, value: 0, volume: 0),
            ],
            info: "Этот паттерн состоит из 3 длинных зеленых свечей, и каждая из них закрывается выше. Когда это возникает внизу нисходящего тренда, и каждая свеча закрывается близко к верху (нет большой верхней тени), это считается сильным сигналом разворота."
        ),
        Pattern(
            name: "Hammer",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 120, closePrice: 122, highPrice: 122, lowPrice: 110, value: 0, volume: 0),
            ],
            info: "Паттерн Молот состоит из 1 свечи. У него маленькое тело вверху свечи, маленькая или отсутствующая верхняя тень и длинная нижняя тень. Нижняя тень должна быть как минимум в два раза больше чем размер тела. Молот — это паттерн бычьего разворота, который находится внизу нисходящего тренда. Он может быть зеленым или красным, но он сильнее, если свеча зеленая. Объем также важен, и он должен быть выше объема предыдущих падающих свечей."
        ),
        Pattern(
            name: "Three black crows",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 260, highPrice: 260, lowPrice: 220, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 250, highPrice: 260, lowPrice: 235, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 260, closePrice: 200, highPrice: 260, lowPrice: 190, value: 0, volume: 0),
            ],
            info: "Этот паттерн состоит из 3 длинных красных свечей, и каждая из них закрывается ниже. Когда это возникает вверху восходящего тренда, и каждая свеча закрывается близко к низу (нет большой нижней тени), это считается сильным сигналом разворота от бычьего к медвежьему рынку."
        ),
        Pattern(
            name: "Bearish evening star",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 250, closePrice: 240, highPrice: 250, lowPrice: 240, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 230, highPrice: 245, lowPrice: 230, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 240, closePrice: 220, highPrice: 240, lowPrice: 220, value: 0, volume: 0),
            ],
            info: "Вечерняя звезда состоит из 3 свечей. Одна свеча с коротким телом между длинной зеленой и длинной красной. Маленькая свеча в середине может быть зеленой или красной. Вечерняя звезда показывает, что давление продаж увеличивается и ситуация переходит в руки медведей. Если объем третьей свечи высокий, паттерн подтверждается, и это считается сильным разворотом тренда и хорошим сигналом для продажи."
        ),
        Pattern(
            name: "Three black crows",
            candles: [
                Candle(date: Candle.stringToDate("2016-04-14T10:44:00+0000"), openPrice: 220, closePrice: 260, highPrice: 260, lowPrice: 220, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T11:44:00+0000"), openPrice: 245, closePrice: 250, highPrice: 260, lowPrice: 235, value: 0, volume: 0),
                Candle(date: Candle.stringToDate("2016-04-14T12:44:00+0000"), openPrice: 260, closePrice: 200, highPrice: 260, lowPrice: 190, value: 0, volume: 0),
            ],
            info: "Этот паттерн состоит из 3 длинных красных свечей, и каждая из них закрывается ниже. Когда это возникает вверху восходящего тренда, и каждая свеча закрывается близко к низу (нет большой нижней тени), это считается сильным сигналом разворота от бычьего к медвежьему рынку."
        ),
    ]
}
