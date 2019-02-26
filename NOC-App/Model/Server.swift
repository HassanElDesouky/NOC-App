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
    private var name: String?
    private var ipAddress: String?
    private var ipSubnetMask: String?
    private var model: ServerModel?
    private var locationId: Int?
    private var status: ServerStatus?
    private var type: ServerType?
    private var serialNumber: String?
    private var version: String?
    private var communicationProtocols: [ServerCommunicationProtocol]?
    private var targetMachines: [Server]?
    private var location: Int?
    private var serialNum: String?
    
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
    
    init(status: ServerStatus?) {
        self.status = status
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
