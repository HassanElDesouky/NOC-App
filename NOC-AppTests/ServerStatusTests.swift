//
//  ServerStatusTests.swift
//  NOC-AppTests
//
//  Created by Hassan El Desouky on 2/26/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import XCTest
@testable import NOC_App

class ServerStatusTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetStatusColor() {
        // Green
        let serverStatusGreen = ServerStatus(id: 1)
        let serverOne = Server(status: serverStatusGreen)
        XCTAssert(ServerStatus.setStatusColor(for: 0, [serverOne]) == .green, "SetStatusColor failed")
        // Orange
        let serverStatusOrange = ServerStatus(id: 2)
        let serverTwo = Server(status: serverStatusOrange)
        XCTAssert(ServerStatus.setStatusColor(for: 0, [serverTwo]) == .orange, "SetStatusColor failed")
        // Yellow
        let serverStatusYellow = ServerStatus(id: 3)
        let serverThree = Server(status: serverStatusYellow)
        XCTAssert(ServerStatus.setStatusColor(for: 0, [serverThree]) == .yellow, "SetStatusColor failed")
        // Red
        let serverStatusRed = ServerStatus(id: 4)
        let serverFour = Server(status: serverStatusRed)
        XCTAssert(ServerStatus.setStatusColor(for: 0, [serverFour]) == .red, "SetStatusColor failed")
        // Gray
        let serverStatus = ServerStatus(id: 5)
        let server = Server(status: serverStatus)
        XCTAssert(ServerStatus.setStatusColor(for: 0, [server]) == .gray, "SetStatusColor failed")
    }
}
