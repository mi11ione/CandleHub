import Foundation

enum RestApi {
    enum Method: String {
        case allTiсkers = "/all-tickers"
        case candles = "/candle"
        case patterns = "/all-patterns"
        case predict_patterns = "/detect-pattern"

        func url(queryItems: [URLQueryItem]? = nil) -> URL? {
            var components = URLComponents()
            components.scheme = nonSecureScheme
            components.host = candleHubHost
            components.path = rawValue

            if let queryItems {
                components.queryItems = queryItems
            }
            return components.url
        }

    }
}

private let nonSecureScheme = "http"
private let scheme = "https"
private let candleHubHost = "157.230.122.16"
private let candle = "/candles.json"
