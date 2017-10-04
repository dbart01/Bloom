//
//  URL+RelativeTests.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-10-03.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class URL_RelativeTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    func testInitWithComponents() {
        let components = [
            "/",
            "var",
            "container",
            "file.txt",
        ]
        
        let url = URL(fileURLWithComponents: components)
        
        XCTAssertNotNil(url)
        XCTAssertEqual(url!.path, "/var/container/file.txt")
    }
    
    func testInitWithEmptyComponents() {
        let url = URL(fileURLWithComponents: [])
        
        XCTAssertNil(url)
    }

    // ----------------------------------
    //  MARK: - Directory -
    //
    func testDirectoryOfFile() {
        let url = URL(fileURLWithPath: "/var/container/file.txt")
        let dir = url.directoryURL()
        
        XCTAssertEqual(dir.path, "/var/container")
    }
    
    func testDirectoryOfDirectory() {
        let url = URL(fileURLWithPath: "/var/container/")
        let dir = url.directoryURL()
        
        XCTAssertEqual(dir.path, "/var/container")
    }
    
    // ----------------------------------
    //  MARK: - Relative Paths -
    //
    func testPathLevelLower() {
        let url1 = URL(fileURLWithPath: "/var/container/lower/")
        let url2 = URL(fileURLWithPath: "/var/container/")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "..")
    }
    
    func testPathLevelHigher() {
        let url1 = URL(fileURLWithPath: "/var/container/")
        let url2 = URL(fileURLWithPath: "/var/container/higher/")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "higher")
    }
    
    func testPathSameLevel() {
        let url1 = URL(fileURLWithPath: "/var/box/")
        let url2 = URL(fileURLWithPath: "/var/container/")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "../container")
    }
    
    func testPathFromRoot() {
        let url1 = URL(fileURLWithPath: "/")
        let url2 = URL(fileURLWithPath: "/var/container")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "var/container")
    }
    
    func testPathToRoot() {
        let url1 = URL(fileURLWithPath: "/var/container/")
        let url2 = URL(fileURLWithPath: "/")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "../..")
    }
    
    func _testPathFromRelative() { // TODO: Fix relative URLs
        let url1 = URL(fileURLWithPath: "var/container/")
        let url2 = URL(fileURLWithPath: "etc/")
        
        let relativeURL = url1.relativePath(to: url2)
        
        XCTAssertNotNil(relativeURL)
        XCTAssertEqual(relativeURL?.relativePath, "../../etc")
    }
}
