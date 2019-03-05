//
//  Server.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

// Obtained from https://app.quicktype.io?share=hnLOJFp31FIRC5oWe5gW
struct Server: Codable {
    let id: Int?
    let name: String?
    let ipAddress: String?
    let ipSubnetMask: IPSubnetMask?
    let model: Model?
    let locationID: Int?
    let status: Status?
    let type: TypeClass?
    let serialNumber, version: String?
    let communicationProtocols: [CommunicationProtocol]?
    let targetMachines: [TargetMachine]?
    let location: Int?
    let serialNum: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, ipAddress, ipSubnetMask, model
        case locationID = "locationId"
        case status, type, serialNumber, version, communicationProtocols, targetMachines, location, serialNum
    }
    
    init(status: Status) {
        self.status = status
        self.id = nil
        self.name = nil
        self.ipAddress = nil
        self.ipSubnetMask = nil
        self.model = nil
        self.locationID = nil
        self.type = nil
        self.serialNumber = nil
        self.version = nil
        self.communicationProtocols = nil
        self.targetMachines = nil
        self.location = nil
        self.serialNum = nil
    }
}

struct CommunicationProtocol: Codable {
    let id: Int?
    let name: Name?
    let defaultPort: Int?
}

enum Name: String, Codable {
    case ssh = "SSH"
    case telnet = "TELNET"
}

enum IPSubnetMask: String, Codable {
    case the2552552550 = "255.255.255.0"
}

struct Model: Codable {
    let id: Int?
    let name: String?
    let creationDate, expiryDate: JSONNull?
}

struct Status: Codable {
    let id: Int?
    let statusValue, legacyValue: String?
    
    static func setStatusColor(for index: Int, _ servers: [Server]) -> UIColor {
        // Sets status color based on the status id.
        let statusId = servers[index].status?.id
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

struct TypeClass: Codable {
    let id: Int?
    let name: String?
}

struct TargetMachine: Codable {
    let id, sourceMachineID: Int?
    let targetMachine: Server?
    let circuitStatusID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sourceMachineID = "sourceMachineId"
        case targetMachine
        case circuitStatusID = "circuitStatusId"
    }
}
