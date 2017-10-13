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

    private let fileManager = FileManager()
    
    private lazy var testDirectory: String = {
        let caseDirectory = String(describing: FileTests.self)
        let tempDirectory = URL(fileURLWithPath: NSTemporaryDirectory())
        return tempDirectory.appendingPathComponent("BloomTests").appendingPathComponent(caseDirectory).path.resolvingSymlinks
    }()
    
    // ----------------------------------
    //  MARK: - Setup -
    //
    override func setUp() {
        super.setUp()
        
        self.removeTestDirectory()
        self.createTestDirectory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.removeTestDirectory()
    }
    
    func removeTestDirectory() {
        try? self.fileManager.removeItem(at: URL(fileURLWithPath: self.testDirectory))
    }
    
    func createTestDirectory() {
        try? self.fileManager.createDirectory(at: URL(fileURLWithPath: self.testDirectory), withIntermediateDirectories: true, attributes: nil)
    }
    
    // ----------------------------------
    //  MARK: - Working Directory -
    //
    func testChangeDirectory() {
        let cdPath  = "~"
        XCTAssertTrue(File.cd(into: cdPath))
        XCTAssertEqual(cdPath.expandingTilde, self.fileManager.currentDirectoryPath)
        
        let cdPath2 = "\(self.testDirectory)".fileURL
        XCTAssertTrue(File.cd(into: cdPath2))
        XCTAssertEqual(cdPath2, URL(fileURLWithPath: self.fileManager.currentDirectoryPath))
    }
    
    func testPresentWorkingDirectory() {
        let pwd1 = "~".expandingTilde
        self.fileManager.changeCurrentDirectoryPath(pwd1)
        
        XCTAssertEqual(pwd1, File.pwd)
        
        let pwd2 = "\(self.testDirectory)".expandingTilde
        self.fileManager.changeCurrentDirectoryPath(pwd2)
        
        XCTAssertEqual(pwd2, File.pwd)
    }
    
    // ----------------------------------
    //  MARK: - Queries -
    //
    func testExistsWithExistingFile() {
        let path = "\(self.testDirectory)/existsFile.txt"
        
        let (preExists, preIsDirectory) = File.exists(path)
        XCTAssertFalse(preExists)
        XCTAssertFalse(preIsDirectory)
        
        self.write("Existing file content", path: path)
        
        let (postExists, postIsDirectory) = File.exists(path)
        XCTAssertTrue(postExists)
        XCTAssertFalse(postIsDirectory)
    }
    
    func testExistsWithExistingDirectory() {
        let path = "\(self.testDirectory)/existsDirectory"
        
        let (preExists, preIsDirectory) = File.exists(path)
        XCTAssertFalse(preExists)
        XCTAssertFalse(preIsDirectory)
        
        try! File.mkdir(path)
        
        let (postExists, postIsDirectory) = File.exists(path)
        XCTAssertTrue(postExists)
        XCTAssertTrue(postIsDirectory)
    }
    
    func testEmptyWithExistingEmptyDirectory() {
        let path = "\(self.testDirectory)/existingEmptyDirectory"
        
        try! File.mkdir(path)
        
        XCTAssertTrue(File.empty(path))
    }
    
    func testEmptyWithNonexistentDirectory() {
        let path = "\(self.testDirectory)/nonexistentDirectory"
        
        XCTAssertTrue(File.empty(path))
    }
    
    // ----------------------------------
    //  MARK: - Move -
    //
    func testMove() {
        let from    = "\(self.testDirectory)/move1.txt"
        let to      = "\(self.testDirectory)/move2.txt"
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
        let from    = "\(self.testDirectory)/copy1.txt"
        let to      = "\(self.testDirectory)/copy2.txt"
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
        let path = "\(self.testDirectory)/toRemove.txt"
        
        try! File.touch(path)
        XCTAssertTrue(self.fileExists(at: path))
        
        try! File.rm(at: path)
        
        XCTAssertFalse(self.fileExists(at: path))
    }
    
    func testRemoveEmptyDirectory() {
        let temp = "\(self.testDirectory)/emptyDir"
        
        try! File.mkdir(temp)
        XCTAssertTrue(self.fileExists(at: temp))
        
        try! File.rm(at: temp)
            
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    func testRemoveNonemptyDirectory() {
        let temp = "\(self.testDirectory)/nonEmpty"
        
        try! File.mkdir(temp)
        XCTAssertTrue(self.fileExists(at: temp))
        
        self.write("File content", path: "\(temp)/file1.txt")
        
        try! File.rm(at: temp, recursive: true)
        
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    func testRemoveNonemptyDirectoryAttempt() {
        let temp = "\(self.testDirectory)/nonEmptyAttempt"
        
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
        let temp = "\(self.testDirectory)/missing"
        
        XCTAssertFalse(self.fileExists(at: temp))
        
        do {
            try File.rm(at: temp)
            XCTFail()
        } catch {
            XCTAssertEqual(error as! File.OperationError, File.OperationError.notFound)
        }
        
        XCTAssertFalse(self.fileExists(at: temp))
    }
    
    func testRemoveSymbolicLink() {
        let temp   = "\(self.testDirectory)/removeSymlink"
        let source = "\(self.testDirectory)/removeSymlinkSource"
        
        self.write("removeSymlink", path: source)
        try! File.ln(at: temp, source: source, symbolic: true)
        
        XCTAssertTrue(self.fileExists(at: temp))
        XCTAssertTrue(self.fileExists(at: source))
        
        try! File.rm(at: temp)
        try! File.rm(at: source)
        
        XCTAssertFalse(self.fileExists(at: temp))
        XCTAssertFalse(self.fileExists(at: source))
    }
    
    // ----------------------------------
    //  MARK: - Links -
    //
    func testLinkHardURL() {
        let source = "\(self.testDirectory)/hardLinkSourceURL".fileURL
        let link   = "\(self.testDirectory)/hardLinkURL".fileURL
        
        self.write("Hard link content", path: source.path)
        
        XCTAssertTrue(self.fileExists(at: source.path))
        XCTAssertFalse(self.fileExists(at: link.path))
        
        try! File.ln(at: link, source: source)
        
        XCTAssertTrue(self.fileExists(at: link.path))
        XCTAssertNil(self.symbolicLinkSource(at: link.path))
    }
    
    func testLinkSymbolicAbsoluteURL() {
        let source = "\(self.testDirectory)/symLinkAbsoluteSourceURL".fileURL
        let link   = "\(self.testDirectory)/symLinkAbsoluteURL".fileURL
        
        self.write("Sym link content", path: source.path)
        
        XCTAssertTrue(self.fileExists(at: source.path))
        XCTAssertFalse(self.fileExists(at: link.path))
        
        try! File.ln(at: link, source: source, symbolic: true)
        
        XCTAssertTrue(self.fileExists(at: link.path))
        XCTAssertEqual(self.symbolicLinkSource(at: link.path), source.path)
    }
    
    func testLinkHard() {
        let source = "\(self.testDirectory)/hardLinkSourceURL"
        let link   = "\(self.testDirectory)/hardLinkURL"
        
        self.write("Hard link content", path: source)
        
        XCTAssertTrue(self.fileExists(at: source))
        XCTAssertFalse(self.fileExists(at: link))
        
        try! File.ln(at: link, source: source)
        
        XCTAssertTrue(self.fileExists(at: link))
        XCTAssertNil(self.symbolicLinkSource(at: link))
    }
    
    func testLinkSymbolicAbsolute() {
        let source = "\(self.testDirectory)/symLinkAbsoluteSource"
        let link   = "\(self.testDirectory)/symLinkAbsolute"
        
        self.write("Sym link absolute content", path: source)
        
        XCTAssertTrue(self.fileExists(at: source))
        XCTAssertFalse(self.fileExists(at: link))
        
        try! File.ln(at: link, source: source, symbolic: true)
        
        XCTAssertTrue(self.fileExists(at: link))
        XCTAssertEqual(self.symbolicLinkSource(at: link), source.expandingTilde)
    }
    
    func testLinkSymbolicRelative() {
        File.cd(into: self.testDirectory)
        
        let source = "symLinkRelativeSource"
        let link   = "symLinkRelative"
        
        self.write("Sym link relative content", path: source)
        
        XCTAssertTrue(self.fileExists(at: source))
        XCTAssertFalse(self.fileExists(at: link))
        
        try! File.ln(at: link, source: source, symbolic: true)
        
        XCTAssertTrue(self.fileExists(at: link))
        XCTAssertEqual(self.symbolicLinkSource(at: link), source)
    }
    
    // ----------------------------------
    //  MARK: - Touch -
    //
    func testTouchNonexistantFile() {
        let path = "\(self.testDirectory)/touch.text"
        
        try! File.touch(path)
        
        let exists = self.fileExists(at: path)
        XCTAssertTrue(exists)
    }
    
    func testTouchExistingFileContentUnchanged() {
        let path    = "\(self.testDirectory)/content.text"
        let content = "This is a test string"
        
        self.write(content, path: path)
        
        let diskContent = self.read(from: path)
        XCTAssertEqual(diskContent, content)
        
        try! File.touch(path)
        
        let actualContent = self.read(from: path)
        XCTAssertEqual(content, actualContent)
    }
    
    func testTouchExistingFileDefaultDate() {
        let path = "\(self.testDirectory)/defaultDate.text"
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
        let path = "\(self.testDirectory)/customDate.text"
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
        let path = "\(self.testDirectory)/mkdir"
        
        try! File.mkdir(path)
        
        XCTAssertTrue(self.fileExists(at: path))
    }
    
    func testCreateDirectoryAttemptIntermediate() {
        let path = "\(self.testDirectory)/intermediate/mkdir"
        
        do {
            try File.mkdir(path)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
        
        XCTAssertFalse(self.fileExists(at: path))
    }
    
    func testCreateDirectoryWithIntermediate() {
        let path = "\(self.testDirectory)/intermediate/mkdir"
        
        try! File.mkdir(path, createIntermediate: true)
        
        XCTAssertTrue(self.fileExists(at: path))
    }
    
    // ----------------------------------
    //  MARK: - Permissions -
    //
    func testPermissionsWriteRaw() {
        let path = "\(self.testDirectory)/permissionsRawWrite"
        self.write("Raw permissions content for writing", path: path)

        XCTAssertEqual(self.posixPermissions(at: path), 0o644)
        
        try! File.chmod(at: path, permissions: 0o777)
        
        XCTAssertEqual(self.posixPermissions(at: path), 0o777)
    }
    
    func testPermissionsWriteTyped() {
        let path = "\(self.testDirectory)/permissionsTypedWrite"
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
        let path = "\(self.testDirectory)/permissionsTypedWriteRecursive"
        
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
        let path = "\(self.testDirectory)/permissionsTypedRead"
        self.write("Typed permissions content for reading", path: path)
        
        let permissions = try! File.chmod(at: path)
        XCTAssertEqual(permissions.rawValue, 0o644)
    }
    
    // ----------------------------------
    //  MARK: - List -
    //
    func testListShallowVisible() {
        let path = "\(self.testDirectory)/listShallowVisible"
        
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
        let path = "\(self.testDirectory)/listDeepShowingHidden"
        
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
        let path = "\(self.testDirectory)/listDeepSkippingPackages"
        
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
    //  MARK: - Symlinks -
    //
    func testResolveAbsoluteSymlinks() {
        let path = "\(self.testDirectory)/symlinksAbsolute"
        
        try! File.mkdir(path)
        
        File.cd(into: path)
        
        let containerPath = "container/subcontainer"
        let fileURL       = "\(containerPath)/file1.txt".fileURL
        let linkURL       = "\(path)/file1_link.txt".fileURL
        
        try! File.mkdir(containerPath, createIntermediate: true)
        self.write("file 1", path: fileURL.path)
        try! File.ln(at: linkURL, source: fileURL, symbolic: true)
        
        let resolvedPath = File.resolveSymlinksIn(linkURL)
        
        XCTAssertEqual(resolvedPath.path, fileURL.path)
    }
    
    func testResolveRelativeSymlinks() {
        let path = "\(self.testDirectory)/symlinksRelative"
        
        try! File.mkdir(path)
        
        File.cd(into: path)
        
        let containerPath = "container/subcontainer"
        let filePath      = "\(containerPath)/file1.txt"
        
        try! File.mkdir(containerPath, createIntermediate: true)
        self.write("file 1", path: "\(containerPath)/file1.txt")
        
        try! File.ln(at: "file1_link.txt", source: filePath, symbolic: true)
        
        let resolvedPath = File.resolveSymlinksIn("file1_link.txt")
        
        XCTAssertEqual(resolvedPath, "\(path)/\(filePath)".expandingTilde)
    }
    
    func testResolveShortSymlink() {
        let path = "/"
        
        let resolvedPath = File.resolveSymlinksIn(path)
        
        XCTAssertEqual(resolvedPath, path)
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
        var url = path.fileURL
        url.removeAllCachedResourceValues()
        
        let values = try! url.resourceValues(forKeys: [.creationDateKey, .contentModificationDateKey, .contentAccessDateKey])
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
