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
        let sequence = EscapeSequence.default
        XCTAssertEqual(sequence.rawValue,         "\u{001B}")
        XCTAssertEqual(sequence.description,      sequence.rawValue)
        XCTAssertEqual(sequence.debugDescription, sequence.rawValue)
    }
}
