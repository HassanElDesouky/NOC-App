//
//  ServerStatus.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerStatus: Decodable {
    let id: Int?
    let statusValue: String?
    let legacyValue: String?
    
    init(id: Int?,
         statusValue: String?,
         legacyValue: String?) {
        self.id = id
        self.statusValue = statusValue
        self.legacyValue = legacyValue
    }
}
