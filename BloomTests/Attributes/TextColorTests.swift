//
//  TextColorTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class TextColorTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testValues() {
        XCTAssertEqual(TextColor.default.rawValue,      39)
        XCTAssertEqual(TextColor.black.rawValue,        30)
        XCTAssertEqual(TextColor.red.rawValue,          31)
        XCTAssertEqual(TextColor.green.rawValue,        32)
        XCTAssertEqual(TextColor.yellow.rawValue,       33)
        XCTAssertEqual(TextColor.blue.rawValue,         34)
        XCTAssertEqual(TextColor.magenta.rawValue,      35)
        XCTAssertEqual(TextColor.cyan.rawValue,         36)
        XCTAssertEqual(TextColor.lightGray.rawValue,    37)
        XCTAssertEqual(TextColor.darkGray.rawValue,     90)
        XCTAssertEqual(TextColor.lightRed.rawValue,     91)
        XCTAssertEqual(TextColor.lightGreen.rawValue,   92)
        XCTAssertEqual(TextColor.lightYellow.rawValue,  93)
        XCTAssertEqual(TextColor.lightBlue.rawValue,    94)
        XCTAssertEqual(TextColor.lightMagenta.rawValue, 95)
        XCTAssertEqual(TextColor.lightCyan.rawValue,    96)
        XCTAssertEqual(TextColor.white.rawValue,        97)
    }
}
