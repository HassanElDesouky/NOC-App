//
//  Content.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct JSONFile: Decodable {
    let content: [Server]
    let pageable: Pageable?
    let totalPages: Int?
    let totalElements: Int?
    let first: Bool?
    let last: Bool?
    let sort: [String: Bool]?
    let numberOfElements: Int?
    let size: Int?
    let number: Int?
    let empty: Bool?
    
    init(servers: [Server], pageable: Pageable?,
        totalPages: Int?, totalElements: Int?,
        first: Bool?, last: Bool?,
        sort: [String: Bool]?, numberOfElements: Int?,
        size: Int?, number: Int?, empty: Bool?) {
        self.content = servers
        self.pageable = pageable
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.first = first
        self.last = last
        self.sort = sort
        self.numberOfElements = numberOfElements
        self.size = size
        self.number = number
        self.empty = empty
    }
}
