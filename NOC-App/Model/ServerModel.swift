//
//  ServerModel.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerModel: Decodable {
    private let id: Int?
    private let name: String?
    private let creationDate: String?
    private let expiryDate: String?
    
    init(id: Int?, name: String?,
         creationDate: String?,
         expiryDate: String?) {
        self.id = id
        self.name = name
        self.creationDate = creationDate
        self.expiryDate = expiryDate
    }
}
