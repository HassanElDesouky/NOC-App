//
//  ServerStatus.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

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
    
    // MARK: Public Methods
    static func setStatusColor(for index: Int, _ servers: [Server]) -> UIColor {
        // Sets status color based on the status id.
        let statusId = servers[index].getStatus()
        switch statusId {
        case 1:
            return .green
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .red
        default:
            return .gray // For unknown values.
        }
    }

}
