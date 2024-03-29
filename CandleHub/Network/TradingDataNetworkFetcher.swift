import Foundation

protocol TradingDataNetworkFetching {
    func getMoexTickers() async -> [TickerMOEX]?
    func getMoexCandles(ticker: String, timePeriod: ChartTimePeriod) async -> [Candle]?
    func getPatterns() async -> [Pattern]?
    func getDetectedPatterns(candles: [Candle]) async -> [DetectedPattern]?
}

final class TradingDataNetworkFetcher: TradingDataNetworkFetching, ObservableObject {
    func getMoexTickers() async -> [TickerMOEX]? {
        var tickers: [TickerMOEX] = []
        var cursor = Cursor(index: 0, total: 0, pageSize: 0)

        repeat {
            guard let url = RestApi.Method.allTiсkers.url(
                queryItems: [URLQueryItem(name: "start", value: String(cursor.index + cursor.pageSize))]
            ) else {
                assertionFailure()
                return nil
            }

            do {
                let data = try await request(url)
                let moexTickers = try decodeJSON(type: MoexTiсkers.self, from: data)
                cursor = parseMoexCursor(moexTickers: moexTickers)
                tickers += parseMoexTikers(moexTickers: moexTickers)
            } catch {
                return nil
            }

        } while (cursor.index + cursor.pageSize) < cursor.total

        return tickers
    }

    func getMoexCandles(ticker: String, timePeriod: ChartTimePeriod) async -> [Candle]? {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "iss.reverse", value: "true"))
        queryItems.append(URLQueryItem(name: "ticker", value: ticker))
        queryItems.append(timePeriod.queryItem)
        guard let url = RestApi.Method.candles.url(queryItems: queryItems) else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let moexCandles = try decodeJSON(type: MoexCandles.self, from: data)
            let candles = parseMoexCandles(moexCandles: moexCandles)
            return candles
        } catch {
            print(error)
        }
        return nil
    }

    func getPatterns() async -> [Pattern]? {
        var queryItems = [URLQueryItem]()
        let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
        queryItems.append(URLQueryItem(name: "language", value: languageCode))

        guard let url = RestApi.Method.patterns.url(queryItems: queryItems) else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let patternsFromBack = try decodeJSON(type: [PatternFromBack].self, from: data)
            let patterns = parsePatternsFromBack(patternsFromBack: patternsFromBack)
            return patterns
        } catch {
            print(error)
        }
        return nil
    }

    func getDetectedPatterns(candles: [Candle]) async -> [DetectedPattern]? {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "language", value: Locale.current.languageCode ?? "ru"))
        guard let url = RestApi.Method.predict_patterns.url(queryItems: queryItems) else {
            assertionFailure()
            return nil
        }

        let body = try? JSONSerialization.data(withJSONObject: parseCandlesToJson(candles: candles))
        print(url)
        do {
            let data = try await request(url, body: body, method: "POST")
            let patternsFromBack = try decodeJSON(type: [DetectedPatternFromBack].self, from: data)
            let patterns = parseDetectedPatternsFromBack(patternsFromBack: patternsFromBack)
            return patterns
        } catch {
            print(error)
        }
        return nil
    }
}

private struct Cursor {
    var index: Int
    let total: Int
    let pageSize: Int
}

private func decodeJSON<T: Decodable>(type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder()
    let response = try decoder.decode(type, from: data)
    return response
}

private func request(_ url: URL, body: Data? = nil, method: String = "GET") async throws -> Data {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 10
    let session = URLSession(configuration: configuration)
    var request = URLRequest(url: url)
    request.httpMethod = method
    if let body {
        request.httpBody = body
    }

    request.setValue(
        "application/json",
        forHTTPHeaderField: "Content-Type"
    )

    let (data, response) = try await session.data(for: request)
    guard let httpURLResponse = response.httpURLResponse, httpURLResponse.isSuccessful else {
        throw NetworkingError.requestFailed
    }
    print(httpURLResponse.statusCode)
    print(httpURLResponse.allHeaderFields)
    return data
}

private func parseMoexCursor(moexTickers: MoexTiсkers) -> Cursor {
    Cursor(
        index: moexTickers.cursor.data[0][0],
        total: moexTickers.cursor.data[0][1],
        pageSize: moexTickers.cursor.data[0][2]
    )
}

private func parseMoexTikers(moexTickers: MoexTiсkers) -> [TickerMOEX] {
    var tickers = [TickerMOEX]()
    for i in 0 ..< moexTickers.history.data.count {
        var title = ""
        let shortName = moexTickers.history.data[i][3]
        switch shortName {
        case let .string(string):
            title = string
        default:
            break
        }
        var subTitle = ""
        let fullName = moexTickers.history.data[i][2]
        switch fullName {
        case let .string(string):
            subTitle = string
        default:
            break
        }
        var closePrice = 0.0
        let value = moexTickers.history.data[i][11]
        switch value {
        case let .double(double):
            closePrice = double
        default:
            break
        }

        var openPrice = 0.0
        let openValue = moexTickers.history.data[i][6]
        switch openValue {
        case let .double(double):
            openPrice = double
        default:
            break
        }
        guard openPrice != 0 else { continue }

        let priceChange = closePrice - openPrice
        let ticker = TickerMOEX(title: title, subTitle: subTitle, price: Money(amount: closePrice, currency: .rub), priceChange: Money(amount: priceChange, currency: .rub))
        tickers.append(ticker)
    }
    return tickers
}

private func parseMoexCandles(moexCandles: MoexCandles) -> [Candle] {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    var candles = [Candle]()
    for i in 0 ..< moexCandles.candles.data.count {
        var date = ""
        let rawDate = moexCandles.candles.data[i][6]
        switch rawDate {
        case let .string(string):
            print(string)
            date = string
        default:
            break
        }
        var openPrice = 0.0
        let openValue = moexCandles.candles.data[i][0]
        switch openValue {
        case let .double(double):
            print(double)
            openPrice = double
        default:
            break
        }
        var closePrice = 0.0
        let closeValue = moexCandles.candles.data[i][1]
        switch closeValue {
        case let .double(double):
            print(double)
            closePrice = double
        default:
            break
        }
        var highPrice = 0.0
        let highValue = moexCandles.candles.data[i][2]
        switch highValue {
        case let .double(double):
            print(double)
            highPrice = double
        default:
            break
        }
        var lowPrice = 0.0
        let lowValue = moexCandles.candles.data[i][3]
        switch lowValue {
        case let .double(double):
            print(double)
            lowPrice = double
        default:
            break
        }
        var value = 0.0
        let valueData = moexCandles.candles.data[i][4]
        switch valueData {
        case let .double(double):
            print(double)
            value = double
        default:
            break
        }
        var volume = 0.0
        let volumeValue = moexCandles.candles.data[i][5]
        switch volumeValue {
        case let .double(double):
            print(double)
            volume = double
        default:
            break
        }

        let candle = Candle(
            date: dateFormatter.date(from: date) ?? Date(timeIntervalSinceNow: 0),
            openPrice: openPrice,
            closePrice: closePrice,
            highPrice: highPrice,
            lowPrice: lowPrice,
            value: value,
            volume: volume
        )
        candles.append(candle)
    }
    return candles
}

private func parseCandlesToJson(candles: [Candle]) -> [[String: Any]] {
    var json: [[String: Any]] = []
    for candle in candles {
        var json_element: [String: Any] = [:]
        json_element["openPrice"] = candle.openPrice
        json_element["highPrice"] = candle.highPrice
        json_element["id"] = candle.id.uuidString
        json_element["date"] = candle.date.ISO8601Format() // "2024-03-27T21:33:06Z"
        json_element["lowPrice"] = candle.lowPrice
        json_element["closePrice"] = candle.closePrice
        json_element["value"] = candle.value
        json_element["volume"] = candle.volume
        json.append(json_element)
    }
    return json
}

private func parsePatternsFromBack(patternsFromBack: [PatternFromBack]) -> [Pattern] {
    var patterns = [Pattern]()
    for patternIndex in patternsFromBack.indices {
        var candles: [Candle] = []

        for candle in patternsFromBack[patternIndex].candles {
            candles.append(
                Candle(
                    date: Candle.stringToDate(candle.date),
                    openPrice: candle.openPrice,
                    closePrice: candle.closePrice,
                    highPrice: candle.highPrice,
                    lowPrice: candle.lowPrice,
                    value: candle.value,
                    volume: candle.volume
                )
            )
        }

        patterns.append(
            Pattern(
                name: patternsFromBack[patternIndex].name,
                candles: candles,
                info: patternsFromBack[patternIndex].info,
                filter: patternsFromBack[patternIndex].filter
            )
        )
    }
    return patterns
}

private func parseDetectedPatternsFromBack(patternsFromBack: [DetectedPatternFromBack]) -> [DetectedPattern] {
    var patterns = [DetectedPattern]()

    for pattern in patternsFromBack {
        patterns.append(
            DetectedPattern(
                name: pattern.name,
                signal: pattern.signal,
                dates: pattern.dates.map { date in
                    Candle.stringToDate(date)
                }
            )
        )
    }
    return patterns
}

enum NetworkingError: Error {
    case requestFailed
}

extension URLResponse {
    /// Returns casted HTTPURLResponse
    var httpURLResponse: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    /// Returns true if statusCode is in range 200...299.
    /// Otherwise false.
    var isSuccessful: Bool {
        200 ... 299 ~= statusCode
    }
}
