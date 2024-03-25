//
//  CandleStick.swift
//  CandleStick
//
//  Created by Кирилл Кошкарёв on 23.03.2024.
//

// Структура для представления свечи
struct Candlestick {
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let timestamp: Double

    var bodyLength: Double {
        abs(close - open)
    }
}

// Перечисление для определения цвета свечи
enum CandleColor {
    case white
    case black
    case neutral
}

// Функция для определения цвета свечи
func candleColor(open: Double, close: Double) -> CandleColor {
    if close > open {
        return .white
    } else if close < open {
        return .black
    } else {
        return .neutral
    }
}

// Функция для поиска паттерна "Two Crows"
func findTwoCrows(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let secondCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let thirdCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        if firstCandle == .white, secondCandle == .black,
           thirdCandle == .black, candles[i].open < candles[i - 1].open,
           candles[i].open > candles[i - 1].close, candles[i].close > candles[i - 2].open,
           candles[i].close < candles[i - 2].close
        {
            signal = -1
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

// Функция для поиска паттерна "Three White Soldiers"
func findThreeWhiteSoldiers(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let secondCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let thirdCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что все три свечи белые
        if firstCandle == .white, secondCandle == .white, thirdCandle == .white {
            // Проверяем, что текущая свеча выше двух предыдущих
            if candles[i].high > candles[i - 1].high, candles[i].high > candles[i - 2].high {
                signal = 1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

// Функция для поиска паттерна "Three Black Crows"
func findThreeBlackCrows(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let secondCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let thirdCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что все три свечи черные
        if firstCandle == .black, secondCandle == .black, thirdCandle == .black {
            // Проверяем, что каждая новая свеча открывается ниже предыдущей
            if candles[i].open < candles[i - 1].open, candles[i - 1].open < candles[i - 2].open {
                // Проверяем, что каждая свеча закрывается ниже предыдущего закрытия
                if candles[i].close < candles[i - 1].close, candles[i - 1].close < candles[i - 2].close {
                    signal = -1
                }
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

// Функция для поиска паттерна "Three Inside Up/Down"
func findThreeInside(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let secondCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        _ = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - белая, а вторая - черная
        if firstCandle == .white, secondCandle == .black {
            // Проверяем, что третья свеча внутри тела второй свечи
            if candles[i].open > candles[i - 1].open, candles[i].close < candles[i - 1].close {
                signal = 1
            }
        } else if firstCandle == .black, secondCandle == .white {
            // Проверяем, что третья свеча внутри тела второй свечи
            if candles[i].open < candles[i - 1].open, candles[i].close > candles[i - 1].close {
                signal = -1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findThreeLineStrike(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 4 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 4].open, close: candles[i - 4].close)
        let secondCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        let thirdCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let fourthCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let fifthCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первые три свечи - черные, а последние две - белые
        if firstCandle == .black, secondCandle == .black, thirdCandle == .black,
           fourthCandle == .white, fifthCandle == .white
        {
            // Проверяем, что пятая свеча открывается ниже первой и закрывается выше первой
            if candles[i].open < candles[i - 4].open, candles[i].close > candles[i - 4].close {
                signal = 1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findThreeOutsideUp(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let secondCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let thirdCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - черная, а вторая и третья - белые
        if firstCandle == .black, secondCandle == .white, thirdCandle == .white {
            // Проверяем, что третья свеча выше первой и второй
            if candles[i].high > candles[i - 2].high, candles[i].high > candles[i - 1].high {
                signal = 1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findThreeStarsInSouth(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 3 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        let secondCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let thirdCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let fourthCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - белая, а следующие две - черные
        if firstCandle == .white, secondCandle == .black, thirdCandle == .black,
           fourthCandle == .black
        {
            // Проверяем, что последняя свеча ниже первой
            if candles[i].low < candles[i - 3].low {
                signal = -1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findAbandonedBaby(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 3 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        _ = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let thirdCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        _ = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - белая, а третья - черная
        if firstCandle == .white, thirdCandle == .black {
            // Проверяем, что вторая свеча имеет "короткое" тело (маленький диапазон между открытием и закрытием)
            let secondCandleRange = candles[i - 2].high - candles[i - 2].low
            if secondCandleRange < (candles[i - 2].open - candles[i - 2].close) * 0.5,
               secondCandleRange > 0
            {
                // Проверяем, что третья свеча открывается ниже первой и закрывается выше второй
                if candles[i].open < candles[i - 3].open, candles[i].close > candles[i - 2].close {
                    signal = 1
                }
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findAdvanceBlock(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 3 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        let secondCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let thirdCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let fourthCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - белая, а следующие две - черные
        if firstCandle == .white, secondCandle == .black, thirdCandle == .black,
           fourthCandle == .black
        {
            // Проверяем, что третья свеча закрывается выше второй и имеет меньшую амплитуду
            if candles[i - 1].close > candles[i - 2].close,
               candles[i - 1].high < candles[i - 2].high,
               candles[i - 1].low > candles[i - 2].low,
               (candles[i - 2].high - candles[i - 2].low) > (candles[i - 1].high - candles[i - 1].low)
            {
                // Проверяем, что четвертая свеча закрывается выше третьей
                if candles[i].close > candles[i - 1].close {
                    signal = 1
                }
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findBeltHold(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let secondCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - белая и вверху тренда, а вторая - длинная черная свеча
        if firstCandle == .white, secondCandle == .black,
           candles[i].open > candles[i - 1].close, candles[i].close < candles[i - 1].close
        {
            signal = 1
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findBreakaway(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 4 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 4].open, close: candles[i - 4].close)
        let secondCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        let thirdCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let fourthCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let fifthCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первая свеча - длинная белая свеча, а следующие четыре - темные
        if firstCandle == .white, secondCandle == .black, thirdCandle == .black,
           fourthCandle == .black, fifthCandle == .black
        {
            // Проверяем, что последняя темная свеча открывается ниже первой и закрывается выше первой
            if candles[i].open < candles[i - 4].open, candles[i].close > candles[i - 4].close {
                signal = 1
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findClosingMarubozu(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что тело свечи полностью заполнено (открытие и закрытие на максимуме или минимуме дня)
        if abs(candle.open - candle.high) < 0.01, abs(candle.close - candle.low) < 0.01 {
            // Проверяем, что свеча белая (закрытие выше открытия) или черная (закрытие ниже открытия)
            if candle.close > candle.open {
                signal = 1 // Сигнал на покупку
            } else if candle.close < candle.open {
                signal = -1 // Сигнал на продажу
            }
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findConcealingBabySwallow(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 6 ..< candles.count {
        let firstCandle = candleColor(open: candles[i - 6].open, close: candles[i - 6].close)
        let secondCandle = candleColor(open: candles[i - 5].open, close: candles[i - 5].close)
        let thirdCandle = candleColor(open: candles[i - 4].open, close: candles[i - 4].close)
        let fourthCandle = candleColor(open: candles[i - 3].open, close: candles[i - 3].close)
        let fifthCandle = candleColor(open: candles[i - 2].open, close: candles[i - 2].close)
        let sixthCandle = candleColor(open: candles[i - 1].open, close: candles[i - 1].close)
        let seventhCandle = candleColor(open: candles[i].open, close: candles[i].close)

        var signal = 0
        // Проверяем, что первые шесть свечей - белые и с телом, которое полностью поглощает предыдущую свечу
        if firstCandle == .white, secondCandle == .white, thirdCandle == .white,
           fourthCandle == .white, fifthCandle == .white, sixthCandle == .white,
           candles[i - 6].close > candles[i - 5].open, candles[i - 5].close > candles[i - 4].open,
           candles[i - 4].close > candles[i - 3].open, candles[i - 3].close > candles[i - 2].open,
           candles[i - 2].close > candles[i - 1].open, candles[i - 1].close > candles[i].open
        {
            // Проверяем, что седьмая свеча - черная и открывается ниже предыдущей
            if seventhCandle == .black, candles[i].open < candles[i - 1].open {
                signal = 1 // Сигнал на покупку
            }
        }
        result.append([candles[i].timestamp, Double(signal)])
    }

    return result
}

func findDoji(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что тело свечи очень маленькое (разница между открытием и закрытием небольшая)
        if abs(candle.open - candle.close) < 0.01 {
            signal = 1 // Сигнал на покупку
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findDojiStar(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let firstCandle = candles[i - 1]
        let secondCandle = candles[i]

        var signal = 0
        // Проверяем, что первая свеча - Doji
        if abs(firstCandle.open - firstCandle.close) < 0.01 {
            // Проверяем, что вторая свеча имеет длинное тело и открывается и закрывается на области Doji
            if secondCandle.high > firstCandle.high, secondCandle.low < firstCandle.low {
                signal = 1 // Сигнал на покупку
            }
        }
        result.append([secondCandle.timestamp, Double(signal)])
    }

    return result
}

func findDragonflyDoji(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что Doji имеет длинную верхнюю тень и отсутствует нижняя тень
        if abs(candle.open - candle.close) < 0.01, candle.high - max(candle.open, candle.close) < 0.01, candle.low - min(candle.open, candle.close) > 0.01 {
            signal = 1 // Сигнал на покупку
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findEngulfing(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let firstCandle = candles[i - 1]
        let secondCandle = candles[i]

        var signal = 0
        // Проверяем, что первая свеча - бычья свеча (белая), а вторая свеча - медвежья (черная),
        // и что тело второй свечи полностью поглощает тело первой свечи
        if firstCandle.close < firstCandle.open, secondCandle.close > secondCandle.open,
           secondCandle.open < firstCandle.close, secondCandle.close > firstCandle.open
        {
            signal = 1 // Сигнал на покупку
        } else if firstCandle.close > firstCandle.open, secondCandle.close < secondCandle.open,
                  secondCandle.open > firstCandle.close, secondCandle.close < firstCandle.open
        {
            signal = -1 // Сигнал на продажу
        }
        result.append([secondCandle.timestamp, Double(signal)])
    }

    return result
}

func findEveningDojiStar(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candles[i - 2]
        let secondCandle = candles[i - 1]
        let thirdCandle = candles[i]

        var signal = 0
        // Проверяем, что первая свеча - бычья свеча (белая), а вторая свеча - Doji,
        // а третья свеча - медвежья свеча (черная)
        if firstCandle.close < firstCandle.open, abs(secondCandle.open - secondCandle.close) < 0.01,
           thirdCandle.close < thirdCandle.open, thirdCandle.close < secondCandle.open,
           thirdCandle.open > secondCandle.close, thirdCandle.open < firstCandle.close
        {
            signal = -1 // Сигнал на продажу
        }
        result.append([thirdCandle.timestamp, Double(signal)])
    }

    return result
}

func findGravestoneDoji(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что Doji имеет длинную нижнюю тень и отсутствует верхняя тень
        if abs(candle.open - candle.close) < 0.01, candle.low - min(candle.open, candle.close) < 0.01, candle.high - max(candle.open, candle.close) > 0.01 {
            signal = -1 // Сигнал на продажу
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findHammer(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что свеча имеет длинную нижнюю тень, короткое или отсутствующее верхнее тело и
        // открытие и закрытие находятся близко друг к другу, но в пределах верхней половины свечи
        if candle.close - candle.open < 0.01, candle.low - min(candle.open, candle.close) < 0.01,
           max(candle.open, candle.close) - candle.high < 0.01, (candle.open - candle.low) / (candle.high - candle.low) < 0.5
        {
            signal = 1 // Сигнал на покупку
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findHangingMan(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let candle = candles[i]

        var signal = 0
        // Проверяем, что свеча имеет длинную нижнюю тень, короткое или отсутствующее верхнее тело и
        // открытие и закрытие находятся близко друг к другу, но в пределах верхней половины свечи
        if candle.close - candle.open < 0.01, candle.low - min(candle.open, candle.close) < 0.01,
           max(candle.open, candle.close) - candle.high < 0.01, (candle.open - candle.low) / (candle.high - candle.low) < 0.5
        {
            signal = -1 // Сигнал на продажу
        }
        result.append([candle.timestamp, Double(signal)])
    }

    return result
}

func findHarami(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем, что предыдущая свеча была "большой" и текущая свеча была "маленькой"
        if previousCandle.open > previousCandle.close, currentCandle.open < currentCandle.close,
           previousCandle.open > currentCandle.close, previousCandle.close < currentCandle.open
        {
            signal = 1 // Сигнал на покупку
        } else if previousCandle.open < previousCandle.close, currentCandle.open > currentCandle.close,
                  previousCandle.open < currentCandle.close, previousCandle.close > currentCandle.open
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findHaramiCross(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем, что предыдущая свеча была "большой" и текущая свеча была "маленькой",
        // при этом тело текущей свечи находится внутри тела предыдущей
        if previousCandle.open > previousCandle.close, currentCandle.open < currentCandle.close,
           previousCandle.open > currentCandle.close, previousCandle.close < currentCandle.open,
           currentCandle.open > previousCandle.open, currentCandle.close < previousCandle.close
        {
            signal = 1 // Сигнал на покупку
        } else if previousCandle.open < previousCandle.close, currentCandle.open > currentCandle.close,
                  previousCandle.open < currentCandle.close, previousCandle.close > currentCandle.open,
                  currentCandle.open < previousCandle.open, currentCandle.close > previousCandle.close
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findHighWave(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let currentCandle = candles[i]

        var signal = 0

        // Проверяем, что тело свечи очень короткое, а длинные верхняя и нижняя тени
        if (currentCandle.high - currentCandle.low) <= (currentCandle.open - currentCandle.close) / 3 {
            signal = 1 // Сигнал на покупку или продажу (зависит от предыдущих свечей)
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findHikkakeModified(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 3 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle1 = candles[i - 1]
        let previousCandle2 = candles[i - 2]
        let previousCandle3 = candles[i - 3]

        var signal = 0

        // Проверяем условия для паттерна "Hikkake Modified"
        if (previousCandle2.open > previousCandle2.close &&
            previousCandle1.open > previousCandle1.close &&
            currentCandle.open > currentCandle.close &&
            previousCandle3.low > min(previousCandle1.low, previousCandle2.low) &&
            previousCandle3.high < max(previousCandle1.high, previousCandle2.high) &&
            currentCandle.open < previousCandle1.open && currentCandle.open > previousCandle1.close &&
            currentCandle.close < previousCandle1.close) ||
            (previousCandle2.open < previousCandle2.close &&
                previousCandle1.open < previousCandle1.close &&
                currentCandle.open < currentCandle.close &&
                previousCandle3.low > min(previousCandle1.low, previousCandle2.low) &&
                previousCandle3.high < max(previousCandle1.high, previousCandle2.high) &&
                currentCandle.open > previousCandle1.open && currentCandle.open < previousCandle1.close &&
                currentCandle.close > previousCandle1.close)
        {
            signal = 1 // Сигнал на покупку или продажу (зависит от предыдущих свечей)
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findHomingPigeon(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем условия для паттерна "Homing Pigeon"
        if previousCandle.open < previousCandle.close,
           currentCandle.open < currentCandle.close,
           currentCandle.open <= previousCandle.high, currentCandle.close >= previousCandle.low,
           currentCandle.high < previousCandle.high, currentCandle.low > previousCandle.low
        {
            signal = 1 // Сигнал на покупку или продажу (зависит от предыдущих свечей)
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findIdenticalThreeCrows(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle1 = candles[i - 1]
        let previousCandle2 = candles[i - 2]

        var signal = 0

        // Проверяем условия для паттерна "Identical Three Crows"
        if previousCandle2.close > previousCandle2.open,
           previousCandle1.close > previousCandle1.open,
           currentCandle.close > currentCandle.open,
           currentCandle.low < previousCandle1.low,
           currentCandle.low < previousCandle2.low,
           currentCandle.high < previousCandle1.high,
           currentCandle.high < previousCandle2.high
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findInNeck(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем условия для паттерна "In-Neck"
        if previousCandle.close > previousCandle.open,
           currentCandle.close < previousCandle.low,
           currentCandle.close > previousCandle.close + (previousCandle.open - previousCandle.close) / 2,
           currentCandle.close < previousCandle.open
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findInvertedHammer(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let currentCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Inverted Hammer"
        if currentCandle.open > currentCandle.close,
           currentCandle.high - currentCandle.close <= 0.1 * (currentCandle.open - currentCandle.close),
           currentCandle.open - currentCandle.low > 3 * (currentCandle.high - currentCandle.close)
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findKickingPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем условия для паттерна "Kicking"
        if previousCandle.open > previousCandle.close, // Предыдущая свеча медвежья
           currentCandle.open < currentCandle.close, // Текущая свеча бычья
           currentCandle.open > previousCandle.high, // Открытие текущей свечи выше максимума предыдущей свечи
           currentCandle.close < previousCandle.low
        { // Закрытие текущей свечи ниже минимума предыдущей свечи
            signal = 1 // Сигнал на покупку
        } else if previousCandle.open < previousCandle.close, // Предыдущая свеча бычья
                  currentCandle.open > currentCandle.close, // Текущая свеча медвежья
                  currentCandle.open < previousCandle.low, // Открытие текущей свечи ниже минимума предыдущей свечи
                  currentCandle.close > previousCandle.high
        { // Закрытие текущей свечи выше максимума предыдущей свечи
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findKickingByLengthPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Вычисляем длину тела предыдущей свечи
        let previousBodyLength = abs(previousCandle.close - previousCandle.open)

        // Проверяем условия для паттерна "Kicking By Length"
        if previousCandle.open > previousCandle.close, // Предыдущая свеча медвежья
           currentCandle.open < currentCandle.close, // Текущая свеча бычья
           currentCandle.open > previousCandle.high, // Открытие текущей свечи выше максимума предыдущей свечи
           currentCandle.close < previousCandle.low, // Закрытие текущей свечи ниже минимума предыдущей свечи
           currentCandle.bodyLength > previousBodyLength
        { // Длина тела текущей свечи больше длины тела предыдущей свечи
            signal = 1 // Сигнал на покупку
        } else if previousCandle.open < previousCandle.close, // Предыдущая свеча бычья
                  currentCandle.open > currentCandle.close, // Текущая свеча медвежья
                  currentCandle.open < previousCandle.low, // Открытие текущей свечи ниже минимума предыдущей свечи
                  currentCandle.close > previousCandle.high, // Закрытие текущей свечи выше максимума предыдущей свечи
                  currentCandle.bodyLength > previousBodyLength
        { // Длина тела текущей свечи больше длины тела предыдущей свечи
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findLadderBottomPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 4 ..< candles.count {
        let firstCandle = candles[i - 4]
        let secondCandle = candles[i - 3]
        let thirdCandle = candles[i - 2]
        let fourthCandle = candles[i - 1]
        let fifthCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Ladder Bottom"
        if firstCandle.open < firstCandle.close, // Первая свеча бычья
           secondCandle.open < secondCandle.close, // Вторая свеча бычья
           thirdCandle.open < thirdCandle.close, // Третья свеча бычья
           fourthCandle.open < fourthCandle.close, // Четвертая свеча бычья
           fifthCandle.open < fifthCandle.close, // Пятая свеча бычья
           firstCandle.low < secondCandle.low, secondCandle.low < thirdCandle.low, thirdCandle.low < fourthCandle.low, fourthCandle.low < fifthCandle.low, // Новые минимумы на каждой свече
           firstCandle.high < secondCandle.high, secondCandle.high<thirdCandle.high, thirdCandle.high < fourthCandle.high, fourthCandle.high < fifthCandle.high, // Новые максимумы на каждой свече
               fifthCandle.close > fourthCandle.close, // Закрытие пятой свечи выше закрытия четвертой свечи
               fifthCandle.close - fifthCandle.open>(fifthCandle.close - fifthCandle.open) * 0.75
        { // Закрытие пятой свечи на 75% или больше от разницы между открытием и закрытием пятой свечи
            signal = 1 // Сигнал на покупку
        }

        result.append([fifthCandle.timestamp, Double(signal)])
    }

    return result
}

func findLongLeggedDojiPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< (candles.count - 1) {
        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        var signal = 0

        // Проверяем условия для паттерна "Long-Legged Doji"
        if abs(currentCandle.open - currentCandle.close) > 2 * abs(currentCandle.high - currentCandle.low), // Тело свечи в два раза больше длины теней
           (currentCandle.high - currentCandle.low) > 3 * abs(currentCandle.open - currentCandle.close), // Длина теней в три раза больше тела свечи
           nextCandle.open == nextCandle.close, // Следующая свеча - дожи
           nextCandle.high == currentCandle.high, // Высшая точка следующей свечи совпадает с высшей точкой текущей
           nextCandle.low == currentCandle.low
        { // Низшая точка следующей свечи совпадает с низшей точкой текущей
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findMarubozuPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< (candles.count - 1) {
        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        var signal = 0

        // Проверяем условия для паттерна "Marubozu"
        if (currentCandle.close - currentCandle.open) > 0.9 * (currentCandle.high - currentCandle.low), // Тело свечи занимает более 90% диапазона
           (nextCandle.close - nextCandle.open) > 0.9 * (nextCandle.high - nextCandle.low)
        { // Тело следующей свечи также занимает более 90% диапазона
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findMatchingLowPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let currentCandle = candles[i]
        let previousCandle = candles[i - 1]

        var signal = 0

        // Проверяем условия для паттерна "Matching Low"
        if currentCandle.low == previousCandle.low, // Нижняя граница текущей свечи совпадает с предыдущей
           currentCandle.close <= previousCandle.close, // Закрытие текущей свечи меньше или равно закрытию предыдущей
           currentCandle.open >= previousCandle.open
        { // Открытие текущей свечи больше или равно открытию предыдущей
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findMatHoldPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 5 ..< candles.count {
        let firstCandle = candles[i - 4]
        let secondCandle = candles[i - 3]
        let thirdCandle = candles[i - 2]
        let fourthCandle = candles[i - 1]
        let fifthCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Mat Hold"
        if firstCandle.close < secondCandle.close,
           secondCandle.close < thirdCandle.close,
           thirdCandle.close < fourthCandle.close,
           fourthCandle.close < fifthCandle.close,
           firstCandle.close > secondCandle.open,
           fifthCandle.close > firstCandle.close
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([fifthCandle.timestamp, Double(signal)])
    }

    return result
}

func findMorningDojiStarPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candles[i - 2]
        let secondCandle = candles[i - 1]
        let thirdCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Morning Doji Star"
        if firstCandle.close < firstCandle.open, // Первая свеча - черная
           secondCandle.close > secondCandle.open, // Вторая свеча - белая
           thirdCandle.close > thirdCandle.open, // Третья свеча - белая
           firstCandle.close > secondCandle.open, // Закрытие первой свечи выше открытия второй свечи
           firstCandle.open > secondCandle.close, // Открытие первой свечи выше закрытия второй свечи
           thirdCandle.open < secondCandle.close, // Открытие третьей свечи ниже закрытия второй свечи
           thirdCandle.close < firstCandle.open
        { // Закрытие третьей свечи ниже открытия первой свечи
            signal = 1 // Сигнал на покупку
        }

        result.append([thirdCandle.timestamp, Double(signal)])
    }

    return result
}

func findMorningStarPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 2 ..< candles.count {
        let firstCandle = candles[i - 2]
        let secondCandle = candles[i - 1]
        let thirdCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Morning Star"
        if firstCandle.close < firstCandle.open, // Первая свеча - черная
           thirdCandle.close > thirdCandle.open, // Третья свеча - белая
           thirdCandle.open < firstCandle.close, // Открытие третьей свечи ниже закрытия первой свечи
           thirdCandle.close > firstCandle.close, // Закрытие третьей свечи выше закрытия первой свечи
           thirdCandle.close > secondCandle.open, // Закрытие третьей свечи выше открытия второй свечи
           thirdCandle.open < secondCandle.close
        { // Открытие третьей свечи ниже закрытия второй свечи
            signal = 1 // Сигнал на покупку
        }

        result.append([thirdCandle.timestamp, Double(signal)])
    }

    return result
}

func findOnNeckLinePattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let firstCandle = candles[i - 1]
        let secondCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "On-Neck Line"
        if firstCandle.close > secondCandle.open, // Закрытие первой свечи выше открытия второй свечи
           firstCandle.close - secondCandle.low <= (firstCandle.high - firstCandle.low) * 0.01
        { // Закрытие первой свечи близко к минимуму второй свечи
            signal = -1 // Сигнал на продажу
        }

        result.append([secondCandle.timestamp, Double(signal)])
    }

    return result
}

func findPiercingPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 1 ..< candles.count {
        let firstCandle = candles[i - 1]
        let secondCandle = candles[i]

        var signal = 0

        // Проверяем условия для паттерна "Piercing"
        if firstCandle.close<firstCandle.open, // Закрытие первой свечи ниже открытия
            secondCandle.close < secondCandle.open, // Закрытие второй свечи ниже открытия
            firstCandle.close > secondCandle.open, // Закрытие первой свечи выше открытия второй свечи
            secondCandle.close>(firstCandle.open + firstCandle.close) / 2
        { // Закрытие второй свечи выше средней точки первой свечи
            signal = 1 // Сигнал на покупку
        }

        result.append([secondCandle.timestamp, Double(signal)])
    }

    return result
}

func findRickshawManPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        let currentCandle = candles[i]
        var signal = 0

        // Проверяем условия для паттерна "Rickshaw Man"
        if currentCandle.open == currentCandle.close, // Открытие и закрытие находятся на одном уровне
           currentCandle.high > currentCandle.open, // Верхняя тень присутствует
           currentCandle.low < currentCandle.open
        { // Нижняя тень присутствует
            signal = 0 // Нейтральный сигнал
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findRiseFallThreeMethodsPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее пяти свечей для образования паттерна
        guard i + 4 < candles.count else { break }

        let firstCandle = candles[i]
        let secondCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]
        let fourthCandle = candles[i + 3]
        let fifthCandle = candles[i + 4]

        // Проверяем условия для паттерна "Rising Three Methods"
        if firstCandle.close < secondCandle.close,
           secondCandle.close < thirdCandle.close,
           thirdCandle.close < fourthCandle.close,
           fourthCandle.close < fifthCandle.close,
           firstCandle.open > fifthCandle.open,
           firstCandle.close < fifthCandle.close
        {
            signal = 1 // Сигнал на покупку
        } else if firstCandle.close > secondCandle.close,
                  secondCandle.close > thirdCandle.close,
                  thirdCandle.close > fourthCandle.close,
                  fourthCandle.close > fifthCandle.close,
                  firstCandle.open < fifthCandle.open,
                  firstCandle.close > fifthCandle.close
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([fifthCandle.timestamp, Double(signal)])
    }

    return result
}

func findSeparatingLinesPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей для образования паттерна
        guard i + 1 < candles.count else { break }

        let firstCandle = candles[i]
        let secondCandle = candles[i + 1]

        // Проверяем условия для паттерна "Separating Lines"
        if firstCandle.close < firstCandle.open, secondCandle.close > secondCandle.open {
            signal = 1 // Сигнал на покупку
        } else if firstCandle.close > firstCandle.open, secondCandle.close < secondCandle.open {
            signal = -1 // Сигнал на продажу
        }

        result.append([secondCandle.timestamp, Double(signal)])
    }

    return result
}

func findShootingStarPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее одной свечи после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Shooting Star"
        if currentCandle.open < currentCandle.close,
           nextCandle.close < currentCandle.open,
           nextCandle.open < currentCandle.close,
           nextCandle.open > currentCandle.open,
           nextCandle.close < currentCandle.low,
           nextCandle.close > currentCandle.low - (currentCandle.high - currentCandle.low) / 2
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([nextCandle.timestamp, Double(signal)])
    }

    return result
}

func findShortLinePattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее одной свечи после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Short Line"
        let currentCandleLength = currentCandle.high - currentCandle.low
        let nextCandleLength = nextCandle.high - nextCandle.low

        if currentCandleLength >= 2 * nextCandleLength {
            signal = -1 // Сигнал на продажу
        } else if nextCandleLength >= 2 * currentCandleLength {
            signal = 1 // Сигнал на покупку
        }

        result.append([nextCandle.timestamp, Double(signal)])
    }

    return result
}

func findTakuriPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее одной свечи после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Takuri"
        if currentCandle.close > currentCandle.open, // Текущая свеча белая
           nextCandle.open > currentCandle.close, // Следующая свеча открывается выше закрытия предыдущей
           nextCandle.close < currentCandle.open, // Следующая свеча закрывается ниже открытия предыдущей
           nextCandle.low > currentCandle.low, // Нижний хвост следующей свечи не превышает нижний хвост текущей свечи
           nextCandle.high < currentCandle.high // Верхний хвост следующей свечи не превышает верхний хвост текущей свечи
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([nextCandle.timestamp, Double(signal)])
    }

    return result
}

func findTasukiGapPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Tasuki Gap"
        if currentCandle.close > currentCandle.open, // Текущая свеча белая
           nextCandle.close > currentCandle.close, // Следующая свеча закрывается выше предыдущей
           thirdCandle.open < nextCandle.close, // Третья свеча открывается ниже закрытия второй свечи
           thirdCandle.close < currentCandle.open // Третья свеча закрывается ниже открытия первой свечи
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([thirdCandle.timestamp, Double(signal)])
    }

    return result
}

func findThrustingPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Thrusting"
        if currentCandle.close > currentCandle.open, // Текущая свеча белая
           nextCandle.close < currentCandle.close, // Следующая свеча закрывается ниже предыдущей
           nextCandle.open > currentCandle.open, // Следующая свеча открывается выше предыдущей
           nextCandle.close > (currentCandle.open + currentCandle.close) / 2 // Закрытие следующей свечи ближе к максимуму предыдущей
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([nextCandle.timestamp, Double(signal)])
    }

    return result
}

func findTristarPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Tristar"
        if currentCandle.close == nextCandle.close, // Закрытие первой и второй свечи одинаково
           currentCandle.close == thirdCandle.close, // Закрытие третьей свечи также одинаково
           currentCandle.open > nextCandle.open, // Открытие первой свечи выше открытия второй
           currentCandle.open > thirdCandle.open, // Открытие первой свечи выше открытия третьей
           currentCandle.close < nextCandle.close, // Закрытие первой свечи ниже закрытия второй
           currentCandle.close < thirdCandle.close // Закрытие первой свечи ниже закрытия третьей
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findUnique3RiverPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Unique 3 River"
        if currentCandle.open > nextCandle.open, // Открытие текущей свечи выше открытия следующей
           nextCandle.open < nextCandle.close, // Открытие следующей свечи ниже ее закрытия
           nextCandle.close > thirdCandle.open, // Закрытие следующей свечи выше открытия третьей
           thirdCandle.open > thirdCandle.close, // Открытие третьей свечи выше ее закрытия
           currentCandle.close > nextCandle.open, // Закрытие текущей свечи выше открытия следующей
           nextCandle.close < thirdCandle.open // Закрытие следующей свечи ниже открытия третьей
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findUpsideGapTwoCrowsPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Upside Gap Two Crows"
        if currentCandle.close < currentCandle.open, // Закрытие текущей свечи ниже ее открытия
           nextCandle.open > currentCandle.close, // Открытие следующей свечи выше закрытия текущей
           nextCandle.close < nextCandle.open, // Закрытие следующей свечи ниже ее открытия
           thirdCandle.close < thirdCandle.open, // Закрытие третьей свечи ниже ее открытия
           thirdCandle.open < nextCandle.close // Открытие третьей свечи ниже закрытия следующей
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findThreeWhiteSoldiersPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Three White Soldiers"
        if currentCandle.close > currentCandle.open, // Закрытие текущей свечи выше ее открытия
           nextCandle.close > nextCandle.open, // Закрытие следующей свечи выше ее открытия
           thirdCandle.close > thirdCandle.open, // Закрытие третьей свечи выше ее открытия
           nextCandle.open > currentCandle.close, // Открытие следующей свечи выше закрытия текущей
           thirdCandle.open > nextCandle.close // Открытие третьей свечи выше закрытия следующей
        {
            signal = 1 // Сигнал на покупку
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findCounterattackPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Counterattack"
        if currentCandle.open > nextCandle.close, // Открытие текущей свечи выше закрытия следующей
           currentCandle.close < nextCandle.open // Закрытие текущей свечи ниже открытия следующей
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findDarkCloudCoverPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 1 < candles.count else { break }

        let currentCandle = candles[i]
        let nextCandle = candles[i + 1]

        // Проверяем условия для паттерна "Dark Cloud Cover"
        let avgBody = (currentCandle.open + currentCandle.close) / 2.0 // Среднее тело текущей свечи
        _ = (nextCandle.open + nextCandle.close) / 2.0 // Среднее тело следующей свечи

        if currentCandle.open < currentCandle.close, // Текущая свеча бычья
           nextCandle.open > nextCandle.close, // Следующая свеча медвежья
           nextCandle.open < currentCandle.close, // Открытие следующей свечи ниже закрытия текущей
           nextCandle.close > avgBody, // Закрытие следующей свечи выше средней точки текущей
           nextCandle.close < currentCandle.open // Закрытие следующей свечи ниже открытия текущей
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([currentCandle.timestamp, Double(signal)])
    }

    return result
}

func findEveningStarPattern(candles: [Candlestick]) -> [[Double]] {
    var result = [[Double]]()

    for i in 0 ..< candles.count {
        var signal = 0

        // Проверяем, что у нас есть не менее двух свечей после текущей для образования паттерна
        guard i + 2 < candles.count else { break }

        let firstCandle = candles[i]
        let secondCandle = candles[i + 1]
        let thirdCandle = candles[i + 2]

        // Проверяем условия для паттерна "Evening Star"
        if firstCandle.close < firstCandle.open, // Первая свеча медвежья
           secondCandle.close > secondCandle.open, // Вторая свеча бычья
           thirdCandle.close < thirdCandle.open, // Третья свеча медвежья
           secondCandle.open < firstCandle.close, // Открытие второй свечи ниже закрытия первой
           secondCandle.close > firstCandle.open, // Закрытие второй свечи выше открытия первой
           thirdCandle.close < secondCandle.open // Закрытие третьей свечи ниже открытия второй
        {
            signal = -1 // Сигнал на продажу
        }

        result.append([firstCandle.timestamp, Double(signal)])
    }

    return result
}

// Function to find the CDLGAPSIDESIDEWHITE pattern
func findGapSideSideWhite(candles: [Candlestick]) -> [[Any]] {
    var result = [[Any]]()

    // Iterate over the candles starting from the third one
    for i in 2 ..< candles.count {
        // Check if the first candle is black and the second candle is white
        if candleColor(open: candles[i - 2].open, close: candles[i - 2].close) == .black,
           candleColor(open: candles[i - 1].open, close: candles[i - 1].close) == .white
        {
            // Check if there are gaps on both sides of the second white candle
            if candles[i - 1].open < candles[i - 2].close, candles[i - 1].close > candles[i - 2].open {
                result.append([candles[i].timestamp, 1]) // Append timestamp and signal for bullish pattern
            } else {
                result.append([candles[i].timestamp, 0]) // Append timestamp and 0 for no pattern
            }
        } else {
            result.append([candles[i].timestamp, 0]) // Append timestamp and 0 for no pattern
        }
    }

    return result
}

// Function to find the CDLHIKKAKE pattern
func findHikkakePattern(candles: [Candlestick]) -> [[Any]] {
    var result = [[Any]]()

    // Iterate over the candles starting from the third one
    for i in 2 ..< candles.count {
        // Check if the first candle is an inside bar
        if candles[i - 1].high < candles[i - 2].high, candles[i - 1].low > candles[i - 2].low {
            // Check if the second candle's high and low are within the range of the first candle
            if candles[i].high < candles[i - 1].high, candles[i].low > candles[i - 1].low {
                result.append([candles[i].timestamp, 1]) // Append timestamp and signal for bullish pattern
            } else {
                result.append([candles[i].timestamp, -1]) // Append timestamp and signal for bearish pattern
            }
        } else {
            result.append([candles[i].timestamp, 0]) // Append timestamp and 0 for no pattern
        }
    }

    return result
}
