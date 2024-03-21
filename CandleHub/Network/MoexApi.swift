import Foundation
enum MoexApi {
    enum Method: String {
        case allTiсkers = "/iss/history/engines/stock/markets/shares/boards/tqbr/securities.json"
        case candles = "/iss/engines/stock/markets/shares/boards/TQBR/securities/"
        func url(tiсker: String?, queryItems: [URLQueryItem]? = nil) -> URL? {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            if let tiсker {
                components.path = rawValue + tiсker + candle
            } else {
                components.path = rawValue
            }
            if let queryItems {
                components.queryItems = queryItems
            }
            return components.url
        }
    }
}

private let scheme = "https"
private let host = "iss.moex.com"
private let candle = "/candles.json"
