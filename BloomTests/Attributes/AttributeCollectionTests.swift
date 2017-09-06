//
//  AttributeCollectionTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class AttributeCollectionTests: XCTestCase {
    
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
