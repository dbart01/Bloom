//
//  BackgroundColorTests.swift
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
