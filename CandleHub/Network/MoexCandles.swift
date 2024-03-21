import Foundation

struct MoexCandles: Decodable {
    let candles: Candles

    struct Candles: Decodable {
        let data: [[Candle]]

        enum Candle: Decodable {
            case double(Double)
            case string(String)

            init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let x = try? container.decode(Double.self) {
                    self = .double(x)
                    return
                }
                if let x = try? container.decode(String.self) {
                    self = .string(x)
                    return
                }
                let debugDescription = "Wrong type for MoexTiсker"
                let error = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: debugDescription)
                throw DecodingError.typeMismatch(Candle.self, error)
            }
        }
    }
}
