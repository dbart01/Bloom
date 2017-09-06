//
//  BackgroundColorTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class BackgroundColorTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testValues() {
        XCTAssertEqual(BackgroundColor.default.rawValue,       49)
        XCTAssertEqual(BackgroundColor.black.rawValue,         40)
        XCTAssertEqual(BackgroundColor.red.rawValue,           41)
        XCTAssertEqual(BackgroundColor.green.rawValue,         42)
        XCTAssertEqual(BackgroundColor.yellow.rawValue,        43)
        XCTAssertEqual(BackgroundColor.blue.rawValue,          44)
        XCTAssertEqual(BackgroundColor.magenta.rawValue,       45)
        XCTAssertEqual(BackgroundColor.cyan.rawValue,          46)
        XCTAssertEqual(BackgroundColor.lightGray.rawValue,     47)
        XCTAssertEqual(BackgroundColor.darkGray.rawValue,     100)
        XCTAssertEqual(BackgroundColor.lightRed.rawValue,     101)
        XCTAssertEqual(BackgroundColor.lightGreen.rawValue,   102)
        XCTAssertEqual(BackgroundColor.lightYellow.rawValue,  103)
        XCTAssertEqual(BackgroundColor.lightBlue.rawValue,    104)
        XCTAssertEqual(BackgroundColor.lightMagenta.rawValue, 105)
        XCTAssertEqual(BackgroundColor.lightCyan.rawValue,    106)
        XCTAssertEqual(BackgroundColor.white.rawValue,        107)
    }
}
