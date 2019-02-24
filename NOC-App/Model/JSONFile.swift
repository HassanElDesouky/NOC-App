//
//  Content.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct JSONFile: Decodable {
    // MARK: Properites
    private var content: [Server]
    private let pageable: Pageable?
    private let totalPages: Int?
    private let totalElements: Int?
    private let first: Bool?
    private let last: Bool?
    private let sort: [String: Bool]?
    private let numberOfElements: Int?
    private let size: Int?
    private let number: Int?
    private let empty: Bool?
    
    // MARK: Init Method
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
    
    // MARK: Getters
    func getContent() -> [Server] {
        return self.content
    }
}
