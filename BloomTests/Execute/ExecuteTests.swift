//
//  ExecuteTests.swift
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

class ExecuteTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Execute Path -
    //
    func testResolvingCommand() {
        let value         = "I like command line."
        let subprocess    = try! Execute.command("echo", args: "-n", value)
        let returnValue   = try! subprocess.outString()
        let errorValue    = try! subprocess.errorString()
        
        XCTAssertEqual(returnValue, value)
        XCTAssertEqual(errorValue, "")
    }
    
    func testNonresolvingCommand() {
        do {
            try Execute.command("somepackgethatdoesntexists", args: "arg")
            XCTFail()
        } catch {
            XCTAssertEqual(error as! Execute.Error, .packageNotFound)
        }
    }
    
    // ----------------------------------
    //  MARK: - Execute URL -
    //
    func testAbsoluteCommand() {
        let value         = "I like command line."
        let command       = URL(fileURLWithPath: "/bin/echo")
        
        let subprocess    = Execute.command(command, args: "-n", value)
        let returnValue   = try! subprocess.outString()
        let errorValue    = try! subprocess.errorString()
        
        XCTAssertEqual(returnValue, value)
        XCTAssertEqual(errorValue, "")
    }
    
    // ----------------------------------
    //  MARK: - Resolve -
    //
    func testResolveExistingPackage() {
        let name     = "echo"
        let expected = "/bin/echo"
        let result   = Execute.resolvePackage(name, in: .system)
        
        XCTAssertEqual(result?.path, expected)
    }
    
    func testResolveNonexistingPackage() {
        let name   = "somepackagethatdoesntexist"
        let result = Execute.resolvePackage(name, in: .system)
        
        XCTAssertNil(result)
    }
}
