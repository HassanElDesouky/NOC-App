//
//  ServerModel.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerModel: Decodable {
    let id: Int?
    let name: String?
    let creationDate: String?
    let expiryDate: String?
    
    init(id: Int?, name: String?,
         creationDate: String?,
         expiryDate: String?) {
        self.id = id
        self.name = name
        self.creationDate = creationDate
        self.expiryDate = expiryDate
    }
}
