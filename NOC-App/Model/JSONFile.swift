//
//  JSONFile.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct JSONFile: Codable {
    let content: [Server]
    let pageable: Pageable
    let totalPages, totalElements: Int
    let last, first: Bool
    let sort: Sort
    let numberOfElements, size, number: Int
    let empty: Bool
}

struct Pageable: Codable {
    let sort: Sort?
    let pageSize, pageNumber, offset: Int?
    let unpaged, paged: Bool?
}

struct Sort: Codable {
    let sorted, unsorted, empty: Bool?
}
