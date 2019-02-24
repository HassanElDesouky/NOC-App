//
//  ServerType.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerType: Decodable {
   private let id: Int?
   private let name: String?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
