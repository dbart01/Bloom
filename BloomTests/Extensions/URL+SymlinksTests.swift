//
//  URL+SymlinksTests.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-10-13.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class URL_SymlinksTests: XCTestCase {

    // ----------------------------------
    //  MARK: - Non-Mutating -
    //
    func testNonmutating() {
        let url      = URL(fileURLWithPath: "/var")
        let resolved = url.resolvingSymlinks()
        
        XCTAssertEqual(url.path,      "/var")
        XCTAssertEqual(resolved.path, "/private/var")
    }
    
    // ----------------------------------
    //  MARK: - Mutating -
    //
    func testMutating() {
        var url = URL(fileURLWithPath: "/var")
        url.resolveSymlinks()
        
        XCTAssertEqual(url.path, "/private/var")
    }
}
