//
//  TextColorTests.swift
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
