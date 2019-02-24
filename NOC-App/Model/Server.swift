//
//  Server.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

struct Server: Decodable {
    // MARK: Properities
    private let name: String?
    private let ipAddress: String?
    private let ipSubnetMask: String?
    private let model: ServerModel?
    private let locationId: Int?
    private let status: ServerStatus?
    private let type: ServerType?
    private let serialNumber: String?
    private let version: String?
    private let communicationProtocols: [ServerCommunicationProtocol]?
    private let targetMachines: [Server]?
    private let location: Int?
    private let serialNum: String?
    
    // MARK: Init Method
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
    
    // MARK: Getters
    func getName() -> String? {
        return self.name
    }
    
    func getIpAddress() -> String? {
        return self.ipAddress
    }
    
    func getIpSubnetMask() -> String? {
        return self.ipSubnetMask
    }
    
    func getStatus() -> Int? {
        return self.status?.getId()
    }
}
