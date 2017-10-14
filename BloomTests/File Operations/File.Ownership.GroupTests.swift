//
//  File.Ownership.GroupTests.swift
//  BloomTests
//
//  The MIT License (MIT)
//
//  Copyright (c) 2017 Dima Bart
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
@testable import Bloom

class FileOwnershipGroupTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testInitWithValidID() {
        let user = File.Ownership.Group(id: 0)
        
        XCTAssertNotNil(user)
        XCTAssertEqual(user!.id,   0)
        XCTAssertEqual(user!.name, "wheel")
    }
    
    func testInitWithInvalidID() {
        let user = File.Ownership.Group(id: 9999)
        XCTAssertNil(user)
    }
    
    func testInitWithValidName() {
        let user = File.Ownership.Group(name: "wheel")
        
        XCTAssertNotNil(user)
        XCTAssertEqual(user!.id,   0)
        XCTAssertEqual(user!.name, "wheel")
    }
    
    func testInitWithInvalidName() {
        let user = File.Ownership.Group(name: "someuserthatdoesntexist")
        XCTAssertNil(user)
    }
    
    // ----------------------------------
    //  MARK: - List -
    //
    func testList() {
        let all = File.Ownership.Group.listAll()
        XCTAssertFalse(all.isEmpty)
    }
    
    func testListRecurring() {
        let all1 = File.Ownership.Group.listAll()
        let all2 = File.Ownership.Group.listAll()
        
        XCTAssertFalse(all1.isEmpty)
        XCTAssertTrue(all1 == all2)
    }
}
