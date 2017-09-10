//
//  AttributeCollectionTests.swift
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

class AttributeCollectionTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testInit() {
        let attributes = AttributeCollection(
            textColor:       .blue,
            backgroundColor: .red,
            styleAttributes: [.blinking]
        )
        
        XCTAssertEqual(attributes.textColor,       .blue)
        XCTAssertEqual(attributes.backgroundColor, .red)
        XCTAssertEqual(attributes.styleAttributes, [.blinking])
    }
    
    func testClearAttribute() {
        let attribute = AttributeCollection.clear()
        XCTAssertEqual(attribute.textColor,       nil)
        XCTAssertEqual(attribute.backgroundColor, nil)
        XCTAssertEqual(attribute.styleAttributes, [Style.clear])
    }
    
    // ----------------------------------
    //  MARK: - Queries -
    //
    func testHasAttributes() {
        var attributes = AttributeCollection()
        
        XCTAssertFalse(attributes.hasAttributes)
        
        attributes.textColor = .red
        
        XCTAssertTrue(attributes.hasAttributes)
        
        attributes.textColor       = nil
        attributes.backgroundColor = .blue
        
        XCTAssertTrue(attributes.hasAttributes)
        
        attributes.backgroundColor = nil
        attributes.styleAttributes.insert(.blinking)
        
        XCTAssertTrue(attributes.hasAttributes)
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    func testDescription() {
        var attributes = AttributeCollection()
        
        XCTAssertEqual(attributes.description, "\u{001B}[m")
        XCTAssertEqual(attributes.debugDescription, attributes.description)
        
        attributes.textColor = .red
        
        XCTAssertEqual(attributes.description, "\u{001B}[31m")
        XCTAssertEqual(attributes.debugDescription, attributes.description)
        
        attributes.textColor       = nil
        attributes.backgroundColor = .blue
        
        XCTAssertEqual(attributes.description, "\u{001B}[44m")
        XCTAssertEqual(attributes.debugDescription, attributes.description)
        
        attributes.backgroundColor = nil
        attributes.styleAttributes.insert(.blinking)
        
        XCTAssertEqual(attributes.description, "\u{001B}[5m")
        XCTAssertEqual(attributes.debugDescription, attributes.description)
        
        attributes.textColor       = .red
        attributes.backgroundColor = .blue
        
        XCTAssertEqual(attributes.description, "\u{001B}[5;31;44m")
        XCTAssertEqual(attributes.debugDescription, attributes.description)
    }
}
