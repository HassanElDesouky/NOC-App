//
//  Pageable.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct Pageable: Decodable {
    let sort: [String: Bool]?
    let pageSize: Int?
    let pageNumber: Int?
    let offset: Int?
    let unpaged: Bool?
    let paged: Bool?
    
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
