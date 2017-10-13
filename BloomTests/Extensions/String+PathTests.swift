//
//  String+PathTests.swift
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

class String_PathTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Setup -
    //
    override func setUp() {
        super.setUp()
        
        System.shared = MockSystem()
    }

    // ----------------------------------
    //  MARK: - Expanding Tilde -
    //
    func testBeginningWithTilde() {
        let path     = "~/Library"
        let expanded = path.expandingTilde
        
        XCTAssertEqual(expanded, "\(MockSystem.shared.homeDirectory)/Library")
    }
    
    func testWithoutTilde() {
        let path     = "/User/someguy/Library"
        let expanded = path.expandingTilde
        
        XCTAssertEqual(expanded, path)
    }
    
    func testTildeWithoutForwardSlash() {
        let path     = "~User/someguy/Library"
        let expanded = path.expandingTilde
        
        XCTAssertEqual(expanded, path)
    }
    
    func testTildeIntermediate() {
        let path     = "/User/someguy/~/Library"
        let expanded = path.expandingTilde
        
        XCTAssertEqual(expanded, path)
    }
    
    func testTildeStandalone() {
        let path     = "~"
        let expanded = path.expandingTilde
        
        XCTAssertEqual(expanded, "\(MockSystem.shared.homeDirectory)")
    }
    
    // ----------------------------------
    //  MARK: - File URL -
    //
    func testConversionToURL() {
        let path = "~/some/path/to/file"
        let url  = path.fileURL
        
        XCTAssertEqual(url.absoluteString, "file://\(MockSystem.shared.homeDirectory)/some/path/to/file")
    }
}

class MockSystem: System {
    
    override var homeDirectory: String {
        return "/Users/johnsmith"
    }
}
