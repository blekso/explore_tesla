
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let example = try? newJSONDecoder().decode(Example.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseExample { response in
//     if let example = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Example
struct Example: Codable {
    let args: Args
    let data: String
    let files, form: Args
    let headers: Headers
    let exampleJSON: JSONNull?
    let method, origin: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case args, data, files, form, headers
        case exampleJSON = "json"
        case method, origin, url
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseArgs { response in
//     if let args = response.result.value {
//       ...
//     }
//   }

// MARK: - Args
struct Args: Codable {
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseHeaders { response in
//     if let headers = response.result.value {
//       ...
//     }
//   }

// MARK: - Headers
struct Headers: Codable {
    let accept, acceptEncoding, acceptLanguage, host: String
    let userAgent, xAmznTraceID: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
        case xAmznTraceID = "X-Amzn-Trace-Id"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
