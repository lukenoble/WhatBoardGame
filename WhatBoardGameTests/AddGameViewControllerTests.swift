//
//  AddGameViewControllerTests.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 30/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import XCTest
@testable import WhatBoardGame

class AddGameViewControllerTests: XCTestCase {
    var vc : AddGameViewController?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.vc = AddGameViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let title = "Monopoly"
        let minPlayers = "2"
        let maxPlayers = "5"
        let averagePlaytime = "120"
        let barcode = "12345"
        let testData = vc?.prepareForSave(title: title, minPlayers: minPlayers, maxPlayers: maxPlayers, averagePlaytime: averagePlaytime, barcode: barcode)
        XCTAssert(testData! == ["Monopoly", "2", "5", "120", "12345"], "The arrays are not the same")
    }
    
}
