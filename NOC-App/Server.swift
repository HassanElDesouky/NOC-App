//
//  Server.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

struct Server: Decodable {
    let name: String?
    let ipAddress: String?
    let ipSubnetMask: String?
    let model: ServerModel?
    let locationId: Int?
    let status: ServerStatus?
    let type: ServerType?
    let serialNumber: String?
    let version: String?
    let communicationProtocols: [ServerCommunicationProtocol]?
    let targetMachines: [Server]?
    let location: Int?
    let serialNum: String?
    
    init(name: String?, ipAddress: String?,
         ipSubnetMask: String?, model: ServerModel?,
         locationId: Int?, status: ServerStatus?,
         type: ServerType?, serialNumber: String?,
         version: String?, communicationProtocols: [ServerCommunicationProtocol]?,
         targetMachines: [Server]?, location: Int?,
         serialNum: String?) {
        
       self.name = name
       self.ipAddress = ipAddress
       self.ipSubnetMask = ipSubnetMask
       self.model = model
       self.locationId = locationId
       self.status = status
       self.type = type
       self.serialNumber = serialNumber
       self.version = version
       self.communicationProtocols = communicationProtocols
       self.targetMachines = targetMachines
       self.location = location
       self.serialNum = serialNum
    }
}
