//
//  Execute_SubprocessTests.swift
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

class Execute_SubprocessTests: XCTestCase {

    // ----------------------------------
    //  MARK: - Init -
    //
    func testInit() {
        let (subprocess, value) = self.createEchoSubprocess()
        
        XCTAssertEqual(subprocess.state,  .ready)
        XCTAssertEqual(subprocess.status, .ok)
        
        XCTAssertEqual(subprocess.command, Execute.resolvePackage("echo", in: .system))
        XCTAssertNotNil(subprocess.args)
        XCTAssertEqual(subprocess.args!, ["-n", value])
    }
    
    func testInitWithoutArgs() {
        let command    = Execute.resolvePackage("echo", in: .system)!
        let subprocess = Execute.Subprocess(command: command, args: nil)
        
        XCTAssertNil(subprocess.args)
    }
    
    // ----------------------------------
    //  MARK: - Launch -
    //
    func testLaunch() {
        let subprocess = self.createEchoSubprocess().process
        
        try! subprocess.launch()
        
        XCTAssertEqual(subprocess.state, .running)
        
        try! subprocess.wait()
        
        XCTAssertEqual(subprocess.state, .finished)
    }
    
    func testLaunchAndWait() {
        let subprocess = self.createEchoSubprocess().process
        
        try! subprocess.launchAndWait()
        
        XCTAssertEqual(subprocess.state, .finished)
    }
    
    func testWaitMultipleTimes() {
        let subprocess = self.createEchoSubprocess().process
        
        try! subprocess.launch()
        
        try! subprocess.wait()
        try! subprocess.wait()
        try! subprocess.wait()
        
        XCTAssertEqual(subprocess.state, .finished)
    }
    
    func testWaitBeforeLaunch() {
        let subprocess = self.createEchoSubprocess().process
        
        do {
            try subprocess.wait()
            XCTFail()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .notLaunched)
        }
    }
    
    func testLaunchAfterLaunch() {
        let subprocess = self.createEchoSubprocess().process
        
        try! subprocess.launch()
        
        do {
            try subprocess.launch()
            XCTFail()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .alreadyRunning)
        }
    }
    
    // ----------------------------------
    //  MARK: - Data -
    //
    func testAccessDataBeforeExecution() {
        let subprocess = self.createEchoSubprocess().process
        
        do {
            _ = try subprocess.outData()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .notLaunched)
        }
        
        do {
            _ = try subprocess.errorData()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .notLaunched)
        }
        
        do {
            _ = try subprocess.outString()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .notLaunched)
        }
        
        do {
            _ = try subprocess.errorString()
        } catch {
            XCTAssertEqual(error as! Execute.Subprocess.Error, .notLaunched)
        }
    }
    
    func testAccessDataAfterSuccessfulExecution() {
        let (subprocess, value) = self.createEchoSubprocess()
        let expectedError       = Data()
        
        try! subprocess.launchAndWait()
        
        XCTAssertEqual(subprocess.status, .ok)
        
        let outData     = try! subprocess.outData()
        let outString   = try! subprocess.outString()
        
        let errorData   = try! subprocess.errorData()
        let errorString = try! subprocess.errorString()
        
        XCTAssertEqual(outData,     value.data(using: .utf8))
        XCTAssertEqual(outString,   value)
        
        XCTAssertEqual(errorData,   expectedError)
        XCTAssertEqual(errorString, String(data: expectedError, encoding: .utf8))
    }
    
    func testAccessDataAfterFailedExecution() {
        let subprocess = self.createInvalidCopySubprocess()
        
        try! subprocess.launchAndWait()
        
        XCTAssertEqual(subprocess.status, .error(64))
        
        let outData     = try! subprocess.outData()
        let outString   = try! subprocess.outString()
        
        let errorData   = try! subprocess.errorData()
        let errorString = try! subprocess.errorString()
        
        XCTAssertEqual(outData,     Data())
        XCTAssertEqual(outString,   "")
        
        XCTAssertTrue(errorData.count   > 0)
        XCTAssertTrue(errorString.count > 0)
    }

    // ----------------------------------
    //  MARK: - Utilities -
    //
    private func createEchoSubprocess() -> (process: Execute.Subprocess, expected: String) {
        let value   = "A cool piece of text."
        let command = Execute.resolvePackage("echo", in: .system)!
        return (Execute.Subprocess(command: command, args: ["-n", value]), value)
    }
    
    private func createInvalidCopySubprocess() -> Execute.Subprocess {
        let command = Execute.resolvePackage("cp", in: .system)!
        return Execute.Subprocess(command: command)
    }
}
