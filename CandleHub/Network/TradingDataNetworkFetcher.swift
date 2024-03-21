
import Foundation

protocol TradingDataNetworkFetching {
    func getMoexTickers() async -> [TickerMOEX]?
    func getMoexCandles(ticker: String, timePeriod: ChartTimePeriod) async -> [Stock]?
}

final class TradingDataNetworkFetcher: TradingDataNetworkFetching, ObservableObject {
    @Published var tickets: [TickerMOEX] = []

    // usage:
//    Task {
//        let candles = await fetcher.getMoexTickers()
//        let tickers = await fetcher.getMoexCandles(ticker: candles!.first!.title, timePeriod: .day)
//     }

    func getMoexTickers() async -> [TickerMOEX]? {
        var tickers: [TickerMOEX] = []
        var cursor = Cursor(index: 0, total: 0, pageSize: 0)

        repeat {
            guard let url = MoexApi.Method.allTiсkers.url(
                tiсker: nil,
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

        tickets = tickers
        return tickers
    }

    func getMoexCandles(ticker: String, timePeriod: ChartTimePeriod) async -> [Stock]? {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "iss.reverse", value: "true"))
        queryItems.append(timePeriod.queryItem)
        guard let url = MoexApi.Method.candles.url(tiсker: ticker, queryItems: queryItems) else {
            assertionFailure()
            return nil
        }
        print(url)
        do {
            let data = try await request(url)
            let moexCandles = try decodeJSON(type: MoexCandles.self, from: data)
            let stocks = parseMoexCandles(moexCandles: moexCandles)
            return stocks
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

private func request(_ url: URL) async throws -> Data {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 10
    let session = URLSession(configuration: configuration)
    let (data, response) = try await session.data(for: URLRequest(url: url))
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

private func parseMoexCandles(moexCandles: MoexCandles) -> [Stock] {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    var stocks = [Stock]()
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

        let stock = Stock(
            date: dateFormatter.date(from: date) ?? Date(timeIntervalSinceNow: 0),
            openPrice: openPrice,
            closePrice: closePrice,
            highPrice: highPrice,
            lowPrice: lowPrice,
            value: value,
            volume: volume
        )
        stocks.append(stock)
    }
    return stocks
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

extension ChartTimePeriod {
    var queryItem: URLQueryItem {
        let value: String
        switch self {
        case .day:
            value = "24"
        case .week:
            value = "7"
        case .month:
            value = "31"
        }
        return URLQueryItem(name: "interval", value: value)
    }
}
