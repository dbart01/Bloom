//
//  AttributeTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class AttributeTests: XCTestCase {

    // ----------------------------------
    //  MARK: - Protocol Extension -
    //
    func testDefaultValue() {
        XCTAssertEqual(TestAttribute.one.value,   1)
        XCTAssertEqual(TestAttribute.two.value,   2)
        XCTAssertEqual(TestAttribute.three.value, 3)
    }
}

private enum TestAttribute: Int {
    case one = 1
    case two
    case three
}
