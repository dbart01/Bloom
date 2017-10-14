//
//  OwnerTypeTests.swift
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

class OwnerTypeTests: XCTestCase {

    // ----------------------------------
    //  MARK: - Equatable -
    //
    func testEqual() {
        let user1 = TestOwner(id: 1, name: "bob")
        let user2 = TestOwner(id: 1, name: "bob")
        
        XCTAssertEqual(user1, user2)
    }
    
    func testNonEqualID() {
        let user1 = TestOwner(id: 1, name: "bob")
        let user2 = TestOwner(id: 2, name: "bob")
        
        XCTAssertNotEqual(user1, user2)
    }
    
    func testNonEqualName() {
        let user1 = TestOwner(id: 1, name: "bob")
        let user2 = TestOwner(id: 1, name: "bobby")
        
        XCTAssertNotEqual(user1, user2)
    }
    
    // ----------------------------------
    //  MARK: - Hashable -
    //
    func testDeterministicHash() {
        let hash1 = TestOwner(id: 1, name: "bob").hashValue
        let hash2 = TestOwner(id: 1, name: "bob").hashValue
        
        XCTAssertEqual(hash1, hash2)
    }
}

// ----------------------------------
//  MARK: - TestOwner -
//
private class TestOwner: OwnerType {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id   = id
        self.name = name
    }
}
