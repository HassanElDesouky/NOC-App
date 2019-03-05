//
//  JSONNull.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 3/6/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

// Obtained from https://app.quicktype.io?share=hnLOJFp31FIRC5oWe5gW
class JSONNull: Codable, Hashable {
    // Encode/decode helpers.
    
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
