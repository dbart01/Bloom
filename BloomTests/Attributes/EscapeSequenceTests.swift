//
//  EscapeSequenceTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class EscapeSequenceTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testValues() {
        XCTAssertEqual(EscapeSequence, "\u{001B}")
    }
}
