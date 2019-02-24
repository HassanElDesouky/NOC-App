//
//  Pageable.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct Pageable: Decodable {
    private let sort: [String: Bool]?
    private let pageSize: Int?
    private let pageNumber: Int?
    private let offset: Int?
    private let unpaged: Bool?
    private let paged: Bool?
    
    init(sort: [String: Bool]?, pageSize: Int?,
        pageNumber: Int?, offset: Int?,
        unpaged: Bool?, paged: Bool?) {
       self.sort = sort
       self.pageSize = pageSize
       self.pageNumber = pageNumber
       self.offset = offset
       self.unpaged = unpaged
       self.paged = paged
    }
}
