//
//  StyleTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class StyleTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testValues() {
        XCTAssertEqual(Style.clear.rawValue,      0)
        XCTAssertEqual(Style.bold.rawValue,       1)
        XCTAssertEqual(Style.dimmed.rawValue,     2)
        XCTAssertEqual(Style.underlined.rawValue, 4)
        XCTAssertEqual(Style.blinking.rawValue,   5)
        XCTAssertEqual(Style.inverted.rawValue,   7)
        XCTAssertEqual(Style.hidden.rawValue,     8)
    }
}
