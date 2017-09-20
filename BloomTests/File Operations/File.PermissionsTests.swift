//
//  File.PermissionsTests.swift
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

class FilePermissionsTests: XCTestCase {

    // ----------------------------------
    //  MARK: - Scope -
    //
    func testScopesRawValues() {
        var scope: File.Permissions.Scope
        
        scope = [.none]
        XCTAssertEqual(scope.rawValue, 0o0)
        
        scope = [.read]
        XCTAssertEqual(scope.rawValue, 0o4)
        
        scope = [.write]
        XCTAssertEqual(scope.rawValue, 0o2)
        
        scope = [.execute]
        XCTAssertEqual(scope.rawValue, 0o1)
        
        scope = [.read, .write]
        XCTAssertEqual(scope.rawValue, 0o6)
        
        scope = [.read, .execute]
        XCTAssertEqual(scope.rawValue, 0o5)
        
        scope = [.write, .execute]
        XCTAssertEqual(scope.rawValue, 0o3)
        
        scope = [.read, .write, .execute]
        XCTAssertEqual(scope.rawValue, 0o7)
        
        scope = [.all]
        XCTAssertEqual(scope.rawValue, 0o7)
    }
    
    func testScopeAlgebra() {
        var scope: File.Permissions.Scope
        
        scope = .init(rawValue: 0o7)
        XCTAssertTrue(scope.can([.read, .write, .execute]))
        
        scope = .init(rawValue: 0o6)
        XCTAssertTrue(scope.can([.read, .write]))
        XCTAssertFalse(scope.can([.execute]))
    }
    
    // ----------------------------------
    //  MARK: - Permissions -
    //
    func testPermissionsRawValueInitializer() {
        
        let directoryPermissions = File.Permissions(rawValue: 0o755)!
        
        XCTAssertEqual(directoryPermissions.user,  [.read, .write, .execute])
        XCTAssertEqual(directoryPermissions.group, [.read, .execute])
        XCTAssertEqual(directoryPermissions.other, [.read, .execute])
        
        let filePermissions = File.Permissions(rawValue: 0o644)!
        
        XCTAssertEqual(filePermissions.user,  [.read, .write])
        XCTAssertEqual(filePermissions.group, .read)
        XCTAssertEqual(filePermissions.other, .read)
        
        let restrictivePermissions = File.Permissions(rawValue: 0o400)!
        
        XCTAssertEqual(restrictivePermissions.user,  .read)
        XCTAssertEqual(restrictivePermissions.group, .none)
        XCTAssertEqual(restrictivePermissions.other, .none)
    }
    
    func testPermissionsRawValues() {
        
        XCTAssertEqual(0o755, File.Permissions(
            user:  [.read, .write, .execute],
            group: [.read, .execute],
            other: [.read, .execute]
        ).rawValue)
        
        XCTAssertEqual(0o644, File.Permissions(
            user:  [.read, .write],
            group: .read,
            other: .read
        ).rawValue)
        
        XCTAssertEqual(0o400, File.Permissions(
            user:  .read,
            group: .none,
            other: .none
        ).rawValue)
    }
}
