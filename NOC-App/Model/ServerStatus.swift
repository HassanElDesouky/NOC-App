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
    private var id: Int?
    private var statusValue: String?
    private var legacyValue: String?
    
    // MARK: Init Method
    init(id: Int?,
         statusValue: String?,
         legacyValue: String?) {
        self.id = id
        self.statusValue = statusValue
        self.legacyValue = legacyValue
    }
    
    init(id: Int?) {
        self.id = id
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
            return UIColor.FlatColor.Green.MountainMeadow
        case 2:
            return UIColor.FlatColor.Orange.NeonCarrot
        case 3:
            return UIColor.FlatColor.Yellow.Turbo
        case 4:
            return UIColor.FlatColor.Red.WellRead
        default:
            return UIColor.FlatColor.Gray.AlmondFrost // For unknown values.
        }
    }

}
