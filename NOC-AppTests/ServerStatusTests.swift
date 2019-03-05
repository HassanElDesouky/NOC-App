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
        let serverStatusGreen = Status(id: 1, statusValue: nil, legacyValue: nil)
        let serverOne = Server(status: serverStatusGreen)
        XCTAssert(Status.setStatusColor(for: 0, [serverOne]) ==
            UIColor.FlatColor.Green.MountainMeadow, "SetStatusColor failed")
        // Orange
        let serverStatusOrange = Status(id: 2, statusValue: nil, legacyValue: nil)
        let serverTwo = Server(status: serverStatusOrange)
        XCTAssert(Status.setStatusColor(for: 0, [serverTwo]) ==
            UIColor.FlatColor.Orange.NeonCarrot, "SetStatusColor failed")
        // Yellow
        let serverStatusYellow = Status(id: 3, statusValue: nil, legacyValue: nil)
        let serverThree = Server(status: serverStatusYellow)
        XCTAssert(Status.setStatusColor(for: 0, [serverThree]) ==
            UIColor.FlatColor.Yellow.Turbo, "SetStatusColor failed")
        // Red
        let serverStatusRed = Status(id: 4, statusValue: nil, legacyValue: nil)
        let serverFour = Server(status: serverStatusRed)
        XCTAssert(Status.setStatusColor(for: 0, [serverFour]) ==
            UIColor.FlatColor.Red.WellRead, "SetStatusColor failed")
        // Gray
        let serverStatus = Status(id: 5, statusValue: nil, legacyValue: nil)
        let server = Server(status: serverStatus)
        XCTAssert(Status.setStatusColor(for: 0, [server]) ==
            UIColor.FlatColor.Gray.AlmondFrost, "SetStatusColor failed")
    }
}
