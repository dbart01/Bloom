//
//  FragmentTests.swift
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

class FragmentTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testInit() {
        let content          = "Error message"
        var attributes       = AttributeCollection()
        attributes.textColor = .blue
        attributes.styleAttributes.insert(.blinking)
        
        let fragment   = Fragment(content, attributeCollection: attributes, shouldClear: false)
        
        XCTAssertEqual(fragment.content,     content)
        XCTAssertEqual(fragment.attributes,  attributes)
        XCTAssertEqual(fragment.shouldClear, false)
    }
    
    func testInitFromStringLiteral() {
        let fragment: Fragment = "Error message"
        XCTAssertEqual(fragment.content, "Error message")
    }
    
    // ----------------------------------
    //  MARK: - Appending -
    //
    func testAppendFragment() {
        let fragment1 = Fragment("Error")
        let fragment2 = Fragment(" message.")
        
        let fragment3 = fragment1.appending(fragment2)
        
        XCTAssertFalse(fragment3 === fragment1)
        XCTAssertFalse(fragment3 === fragment2)
        
        XCTAssertNotNil(fragment3.parent)
        XCTAssertEqual(fragment3.parent!, fragment1)
        XCTAssertNil(fragment1.parent)
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    func testDescription() {
        let fragment1 = Fragment("Something ")
        let fragment2 = Fragment("exploded").redText.blueBackground
        let fragment3 = Fragment(" just now.").underlined
        let fragment4 = fragment1.appending(fragment2).appending(fragment3)
        
        let description = fragment4.description
        
        XCTAssertEqual(description, "Something \u{1B}[31;44mexploded\u{1B}[0m\u{1B}[4m just now.\u{1B}[0m")
        XCTAssertEqual(fragment4.debugDescription, description)
    }
    
    // ----------------------------------
    //  MARK: - Equality -
    //
    func testEquality() {
        let fragment1 = Fragment("explosion").redText.underlined
        let fragment2 = Fragment("explosion").redText.underlined
        
        XCTAssertEqual(fragment1, fragment2)
        XCTAssertFalse(fragment1 === fragment2)
    }
    
    // ----------------------------------
    //  MARK: - Operators -
    //
    func testOperators() {
        let tail     = " in the movie."
        let fragment = Fragment("Something ") + Fragment("exploded").redText.blueBackground + Fragment(" just now").underlined + tail
        
        XCTAssertEqual(fragment.description, "Something \u{1B}[31;44mexploded\u{1B}[0m\u{1B}[4m just now\u{1B}[0m in the movie.")
    }
}
