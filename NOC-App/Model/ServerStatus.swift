//
//  ServerStatus.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerStatus: Decodable {
    // MARK: Properities
    private let id: Int?
    private let statusValue: String?
    private let legacyValue: String?
    
    // MARK: Init Method
    init(id: Int?,
         statusValue: String?,
         legacyValue: String?) {
        self.id = id
        self.statusValue = statusValue
        self.legacyValue = legacyValue
    }
    
    //MARK: Getters
    func getId() -> Int? {
        return self.id
    }
}
