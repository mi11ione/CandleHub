import Foundation

struct MoexTiсkers: Decodable {
    let history: History
    let cursor: Cursor

    struct History: Decodable {
        let columns: [String]
        let data: [[MoexTiсker]]

        enum MoexTiсker: Decodable {
            case double(Double)
            case string(String)
            case null

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
                if container.decodeNil() {
                    self = .null
                    return
                }
                let debugDescription = "Wrong type for MoexTiсker"
                let error = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: debugDescription)
                throw DecodingError.typeMismatch(MoexTiсker.self, error)
            }
        }
    }

    struct Cursor: Decodable {
        let data: [[Int]]
    }

    enum CodingKeys: String, CodingKey {
        case history
        case cursor = "history.cursor"
    }
}
