//
//  FileTests.swift
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

class FileTests: XCTestCase {
    
    static let testsDirectory = "BloomTests"
    static let caseDirectory  = String(describing: FileTests.self)
    static let rootPath       = "~/\(FileTests.testsDirectory)/\(FileTests.caseDirectory)"

    private let fileManager = FileManager()
    private var testDirectory: URL!
    
    // ----------------------------------
    //  MARK: - Setup -
    //
    override func setUp() {
        super.setUp()
        
        self.setupTestDirectory()
        self.recreateTestDirectory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.recreateTestDirectory()
    }
    
    func setupTestDirectory() {
        let homeDirectory  = URL(fileURLWithPath: NSHomeDirectory())
        self.testDirectory = homeDirectory.appendingPathComponent(FileTests.testsDirectory).appendingPathComponent(FileTests.caseDirectory)
    }
    
    func recreateTestDirectory() {
        try? self.fileManager.removeItem(at: self.testDirectory)
        try? self.fileManager.createDirectory(at: self.testDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    // ----------------------------------
    //  MARK: - Working Directory -
    //
    func testChangeDirectory() {
        let userDir = "~".expandingTilde
        XCTAssertEqual(userDir, self.fileManager.currentDirectoryPath)
        
        let cdPath  = "~"
        XCTAssertTrue(File.cd(into: cdPath))
        XCTAssertEqual(cdPath.expandingTilde, self.fileManager.currentDirectoryPath)
        
        let cdPath2 = "\(FileTests.rootPath)".fileURL
        XCTAssertTrue(File.cd(into: cdPath2))
        XCTAssertEqual(cdPath2, URL(fileURLWithPath: self.fileManager.currentDirectoryPath))
    }
    
    func testPresentWorkingDirectory() {
        let pwd1 = "~".expandingTilde
        self.fileManager.changeCurrentDirectoryPath(pwd1)
        
        XCTAssertEqual(pwd1, File.pwd)
        
        let pwd2 = "\(FileTests.rootPath)".expandingTilde
        self.fileManager.changeCurrentDirectoryPath(pwd2)
        
        XCTAssertEqual(pwd2, File.pwd)
    }
    
    // ----------------------------------
    //  MARK: - Queries -
    //
    func testExistsWithExistingFile() {
        let path = "\(FileTests.rootPath)/existsFile.txt"
        
        let (preExists, preIsDirectory) = File.exists(path)
        XCTAssertFalse(preExists)
        XCTAssertFalse(preIsDirectory)
        
        self.write("Existing file content", path: path)
        
        let (postExists, postIsDirectory) = File.exists(path)
        XCTAssertTrue(postExists)
        XCTAssertFalse(postIsDirectory)
    }
    
    func testExistsWithExistingDirectory() {
        let path = "\(FileTests.rootPath)/existsDirectory"
        
        let (preExists, preIsDirectory) = File.exists(path)
        XCTAssertFalse(preExists)
        XCTAssertFalse(preIsDirectory)
        
        try! File.mkdir(path)
        
        let (postExists, postIsDirectory) = File.exists(path)
        XCTAssertTrue(postExists)
        XCTAssertTrue(postIsDirectory)
    }
    
    func testEmptyWithExistingEmptyDirectory() {
        let path = "\(FileTests.rootPath)/existingEmptyDirectory"
        
        try! File.mkdir(path)
        
        XCTAssertTrue(File.empty(path))
    }
    
    func testEmptyWithNonexistentDirectory() {
        let path = "\(FileTests.rootPath)/nonexistentDirectory"
        
        XCTAssertTrue(File.empty(path))
    }
    
    // ----------------------------------
    //  MARK: - Move -
    //
    func testMove() {
        let from    = "\(FileTests.rootPath)/move1.txt"
        let to      = "\(FileTests.rootPath)/move2.txt"
        let content = "Move content"
        
        self.write(content, path: from)
        
        XCTAssertTrue(self.fileExists(at: from))
        XCTAssertFalse(self.fileExists(at: to))
        
        try! File.mv(from: from, to: to)
        
        XCTAssertFalse(self.fileExists(at: from))
        XCTAssertTrue(self.fileExists(at: to))
        
        let movedContent = self.read(from: to)
        XCTAssertEqual(movedContent, content)
    }
    
    // ----------------------------------
    //  MARK: - Copy -
    //
    func testCopy() {
        let from    = "\(FileTests.rootPath)/copy1.txt"
        let to      = "\(FileTests.rootPath)/copy2.txt"
        let content = "Copy content"
        
        self.write(content, path: from)
        
        XCTAssertTrue(self.fileExists(at: from))
        XCTAssertFalse(self.fileExists(at: to))
        
        try! File.cp(from: from, to: to)
        
        XCTAssertTrue(self.fileExists(at: from))
        XCTAssertTrue(self.fileExists(at: to))
        
        let copiedContent = self.read(from: to)
        XCTAssertEqual(copiedContent, content)
    }
    
    // ----------------------------------
    //  MARK: - Delete -
    //
    func testRemoveFile() {
        let path = "\(FileTests.rootPath)/toRemove.txt"
        
        try! File.touch(path)
        XCTAssertTrue(self.fileExists(at: path))
        
        try! File.rm(at: path)
        
        XCTAssertFalse(self.fileExists(at: path))
    }
    
    func testRemoveEmptyDirectory() {
        let temp = "\(FileTests.rootPath)/emptyDir"
        
        try! File.mkdir(temp)
        XCTAssertTrue(self.fileExists(at: temp))
        
        try! File.rm(at: temp)
            
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    func testRemoveNonemptyDirectory() {
        let temp = "\(FileTests.rootPath)/nonEmpty"
        
        try! File.mkdir(temp)
        XCTAssertTrue(self.fileExists(at: temp))
        
        self.write("File content", path: "\(temp)/file1.txt")
        
        try! File.rm(at: temp, recursive: true)
        
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    func testRemoveNonemptyDirectoryAttempt() {
        let temp = "\(FileTests.rootPath)/nonEmptyAttempt"
        
        try! File.mkdir(temp)
        XCTAssertTrue(self.fileExists(at: temp))
        
        try! File.touch("\(temp)/file1.txt")
        try! File.touch("\(temp)/file2.txt")
        try! File.touch("\(temp)/file3.txt")
        
        do {
            try File.rm(at: temp)
            XCTFail()
        } catch {
            XCTAssertEqual(error as! File.OperationError, File.OperationError.nonEmptyDirectory)
        }
        
        XCTAssertTrue(self.fileExists(at: temp))
    }
    
    func testRemoveNonexistantDirectory() {
        let temp = "\(FileTests.rootPath)/missing"
        
        XCTAssertFalse(self.fileExists(at: temp))
        
        do {
            try File.rm(at: temp)
            XCTFail()
        } catch {
            XCTAssertEqual(error as! File.OperationError, File.OperationError.notFound)
        }
        
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    // ----------------------------------
    //  MARK: - Links -
    //
    func testLinkHard() {
        let source = "\(FileTests.rootPath)/hardLinkSource"
        let link   = "\(FileTests.rootPath)/hardLink"
        
        self.write("Hard link content", path: source)
        
        XCTAssertTrue(self.fileExists(at: source))
        XCTAssertFalse(self.fileExists(at: link))
        
        try! File.ln(at: link, source: source)
        
        XCTAssertTrue(self.fileExists(at: link))
        XCTAssertNil(self.symbolicLinkSource(at: link))
    }
    
    func testLinkSymbolic() {
        let source = "\(FileTests.rootPath)/symLinkSource"
        let link   = "\(FileTests.rootPath)/symLink"
        
        self.write("Sym link content", path: source)
        
        XCTAssertTrue(self.fileExists(at: source))
        XCTAssertFalse(self.fileExists(at: link))
        
        try! File.ln(at: link, source: source, symbolic: true)
        
        XCTAssertTrue(self.fileExists(at: link))
        XCTAssertEqual(self.symbolicLinkSource(at: link), source.expandingTilde)
    }
    
    // ----------------------------------
    //  MARK: - Touch -
    //
    func testTouchNonexistantFile() {
        let path = "\(FileTests.rootPath)/touch.text"
        
        try! File.touch(path)
        
        let exists = self.fileExists(at: path)
        XCTAssertTrue(exists)
    }
    
    func testTouchExistingFileContentUnchanged() {
        let path    = "\(FileTests.rootPath)/content.text"
        let content = "This is a test string"
        
        self.write(content, path: path)
        
        let diskContent = self.read(from: path)
        XCTAssertEqual(diskContent, content)
        
        try! File.touch(path)
        
        let actualContent = self.read(from: path)
        XCTAssertEqual(content, actualContent)
    }
    
    func testTouchExistingFileDefaultDate() {
        let path = "\(FileTests.rootPath)/defaultDate.text"
        self.write("Content", path: path)
        
        let originalDates = self.touchDates(at: path)
        
        sleep(1)
        
        try! File.touch(path)
        
        let newDates = self.touchDates(at: path)
        
        XCTAssertEqual(newDates.created, originalDates.created)
        XCTAssertTrue(newDates.modified > originalDates.modified)
        XCTAssertTrue(newDates.accessed > originalDates.accessed)
    }
    
    func testTouchExistingFileCustomDate() {
        let path = "\(FileTests.rootPath)/customDate.text"
        self.write("Content", path: path)
        
        let date = self.futureDate()
        
        try! File.touch(path, date: date)
        
        let touchDates = self.touchDates(at: path)
        
        XCTAssertNotEqual(touchDates.created, date)
        XCTAssertEqual(touchDates.modified,  date)
        XCTAssertEqual(touchDates.accessed, date)
    }
    
    // ----------------------------------
    //  MARK: - Create Directory -
    //
    func testCreateDirectoryWithoutIntermediate() {
        let path = "\(FileTests.rootPath)/mkdir"
        
        try! File.mkdir(path)
        
        XCTAssertTrue(self.fileExists(at: path))
    }
    
    func testCreateDirectoryAttemptIntermediate() {
        let path = "\(FileTests.rootPath)/intermediate/mkdir"
        
        do {
            try File.mkdir(path)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
        
        XCTAssertFalse(self.fileExists(at: path))
    }
    
    func testCreateDirectoryWithIntermediate() {
        let path = "\(FileTests.rootPath)/intermediate/mkdir"
        
        try! File.mkdir(path, createIntermediate: true)
        
        XCTAssertTrue(self.fileExists(at: path))
    }
    
    // ----------------------------------
    //  MARK: - Permissions -
    //
    func testPermissionsWriteRaw() {
        let path = "\(FileTests.rootPath)/permissionsRawWrite"
        self.write("Raw permissions content for writing", path: path)

        XCTAssertEqual(self.posixPermissions(at: path), 0o644)
        
        try! File.chmod(at: path, permissions: 0o777)
        
        XCTAssertEqual(self.posixPermissions(at: path), 0o777)
    }
    
    func testPermissionsWriteTyped() {
        let path = "\(FileTests.rootPath)/permissionsTypedWrite"
        self.write("Typed permissions content for writing", path: path)
        
        XCTAssertEqual(self.posixPermissions(at: path), 0o644)
        
        try! File.chmod(at: path, permissions: File.Permissions(
            user:  .read,
            group: .none,
            other: .none
        ))
        
        XCTAssertEqual(self.posixPermissions(at: path), 0o400)
    }
    
    func testPermissionsWriteTypedRecursive() {
        let path = "\(FileTests.rootPath)/permissionsTypedWriteRecursive"
        
        let directories = [
            path,
            "\(path)/dir",
            "\(path)/package.app",
        ]
        
        let files = [
            "\(path)/.file0",
            "\(path)/file1",
            "\(path)/dir/.file0",
            "\(path)/dir/file1",
            "\(path)/package.app/file0",
            "\(path)/package.app/file1",
        ]
        
        directories.forEach {
            try! File.mkdir($0)
        }
        
        files.forEach {
            self.write("File content: \($0)", path: $0)
        }
        
        /* ---------------------------------
         ** Verify the pre-chmod permissions
         */
        directories.forEach {
            XCTAssertEqual(self.posixPermissions(at: $0), 0o755)
        }
        
        files.forEach {
            XCTAssertEqual(self.posixPermissions(at: $0), 0o644)
        }
        
        /* ---------------------------------
         ** Recursively update permissions
         */
        let permissions = File.Permissions(
            user:  [.all],
            group: [.all],
            other: [.all]
        )
        try! File.chmod(at: path, permissions: permissions, recursive: true)
        
        /* ---------------------------------
         ** Assert post-chmod permissions
         */
        directories.forEach {
            XCTAssertEqual(self.posixPermissions(at: $0), permissions.rawValue)
        }
        
        files.forEach {
            XCTAssertEqual(self.posixPermissions(at: $0), permissions.rawValue)
        }
    }
    
    func testPermissionsRead() {
        let path = "\(FileTests.rootPath)/permissionsTypedRead"
        self.write("Typed permissions content for reading", path: path)
        
        let permissions = try! File.chmod(at: path)
        XCTAssertEqual(permissions.rawValue, 0o644)
    }
    
    // ----------------------------------
    //  MARK: - List -
    //
    func testListShallowVisible() {
        let path = "\(FileTests.rootPath)/listShallowVisible"
        
        try! File.mkdir(path)
        self.write("File 0 content", path: "\(path)/.file0")
        self.write("File 1 content", path: "\(path)/file1")
        self.write("File 2 content", path: "\(path)/file2")
        self.write("File 3 content", path: "\(path)/file3")
        
        var listing = try! File.ls(path)
        
        listing.sort()
        
        XCTAssertEqual(listing.count, 3)
        XCTAssertEqual(listing, [
            "\(path)/file1".expandingTilde,
            "\(path)/file2".expandingTilde,
            "\(path)/file3".expandingTilde,
        ])
    }
    
    func testListDeepShowingHidden() {
        let path = "\(FileTests.rootPath)/listDeepShowingHidden"
        
        try! File.mkdir(path)
        self.write("File 0 content", path: "\(path)/.file0")
        self.write("File 1 content", path: "\(path)/file1")
        self.write("File 2 content", path: "\(path)/file2")
        self.write("File 3 content", path: "\(path)/file3")
        
        try! File.mkdir("\(path)/dir1")
        self.write("File 0 content", path: "\(path)/dir1/.file0")
        self.write("File 1 content", path: "\(path)/dir1/file1")
        
        try! File.mkdir("\(path)/dir1/dir2")
        self.write("File 0 content", path: "\(path)/dir1/dir2/.file0")
        self.write("File 1 content", path: "\(path)/dir1/dir2/file1")
        
        var listing = try! File.ls(path, options: [.recursive, .hidden])
        
        listing.sort()
        
        XCTAssertEqual(listing.count, 10)
        XCTAssertEqual(listing, [
            "\(path)/.file0".expandingTilde,
            "\(path)/dir1".expandingTilde,
            "\(path)/dir1/.file0".expandingTilde,
            "\(path)/dir1/dir2".expandingTilde,
            "\(path)/dir1/dir2/.file0".expandingTilde,
            "\(path)/dir1/dir2/file1".expandingTilde,
            "\(path)/dir1/file1".expandingTilde,
            "\(path)/file1".expandingTilde,
            "\(path)/file2".expandingTilde,
            "\(path)/file3".expandingTilde,
        ])
    }
    
    func testListDeepSkippingPackages() {
        let path = "\(FileTests.rootPath)/listDeepSkippingPackages"
        
        try! File.mkdir(path)
        try! File.mkdir("\(path)/Test.app")
        self.write("File 1 content", path: "\(path)/Test.app/file1")
        self.write("File 2 content", path: "\(path)/Test.app/file2")
        
        let listing = try! File.ls(path, options: [.recursive, .hidden, .skipPackages])
        
        XCTAssertEqual(listing.count, 1)
        XCTAssertEqual(listing, [
            "\(path)/Test.app".expandingTilde,
        ])
    }
    
    // ----------------------------------
    //  MARK: - Utilities -
    //
    private func fileExists(at path: FilePath) -> Bool {
        return self.fileManager.fileExists(atPath: path.expandingTilde)
    }
    
    private func symbolicLinkSource(at path: FilePath) -> FilePath? {
        return try? self.fileManager.destinationOfSymbolicLink(atPath: path.expandingTilde)
    }
    
    private func write(_ content: String, path: FilePath) {
        try! content.data(using: .utf8)!.write(to: path.fileURL)
    }
    
    private func read(from path: FilePath) -> String {
        return String(data: try! Data(contentsOf: path.fileURL), encoding: .utf8)!
    }
    
    private func posixPermissions(at path: FilePath) -> Int {
        let permissions = try! self.fileManager.attributesOfItem(atPath: path.expandingTilde)
        return permissions[FileAttributeKey.posixPermissions] as! Int
    }
    
    private func touchDates(at path: FilePath) -> (created: Date, modified: Date, accessed: Date) {
        let values = try! path.fileURL.resourceValues(forKeys: [.creationDateKey, .contentModificationDateKey, .contentAccessDateKey])
        return (
            values.creationDate!,
            values.contentModificationDate!,
            values.contentAccessDate!
        )
    }
    
    private func futureDate() -> Date {
        let now = Double(Int(Date().timeIntervalSince1970))
        return Date(timeIntervalSince1970: now + 900)
    }
}
