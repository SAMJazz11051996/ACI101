//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Syed Ahmad Mujtaba on 17/11/2022.
//  Copyright © 2022 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {

    var entryUnderTest: Entry!
    
    override func setUp() {
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }
    
    override func tearDown() {
        entryUnderTest = nil
        super.tearDown()
    }
    
    func testSerialization() {
        let serializeData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializeData!)
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }

}