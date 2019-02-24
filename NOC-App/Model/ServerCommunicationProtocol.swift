//
//  ServerCommunicationProtocol.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

struct ServerCommunicationProtocol: Decodable {
    private let id: Int?
    private let name: String?
    private let defaultPort: Int?
    
    init(id: Int?, name: String?,
         defaultPort: Int?) {
        self.id = id
        self.name = name
        self.defaultPort = defaultPort
    }
}
