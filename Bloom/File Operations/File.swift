//
//  File.swift
//  Bloom
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

import Foundation

public typealias FilePath = String

public class File {
    
    private static let fileManager = FileManager()
    
    // ----------------------------------
    //  MARK: - Working Directory -
    //
    public static func cd(into path: FilePath) -> Bool {
        return self.fileManager.changeCurrentDirectoryPath(path.expandingTilde)
    }
    
    public static func cd(into url: URL) -> Bool {
        return self.cd(into: url.path)
    }
    
    public static var pwd: FilePath {
        return self.fileManager.currentDirectoryPath
    }
    
    // ----------------------------------
    //  MARK: - Move -
    //
    public static func mv(from: FilePath, to: FilePath) throws {
        try self.mv(from: from.fileURL, to: to.fileURL)
    }
    
    public static func mv(from: URL, to: URL) throws {
        try self.fileManager.moveItem(at: from, to: to)
    }
    
    // ----------------------------------
    //  MARK: - Copy -
    //
    public static func cp(from: FilePath, to: FilePath) throws {
        try self.cp(from: from.fileURL, to: to.fileURL)
    }
    
    public static func cp(from: URL, to: URL) throws {
        try self.fileManager.copyItem(at: from, to: to)
    }
    
    // ----------------------------------
    //  MARK: - Delete -
    //
    public static func rm(at: FilePath, recursive: Bool = false) throws {
        try self.rm(at: at.fileURL, recursive: recursive)
    }
    
    public static func rm(at url: URL, recursive: Bool = false) throws {
        
        var isEmpty: Bool         = false
        var isDirectory: ObjCBool = false
        
        let fileExists = self.fileManager.fileExists(atPath: url.path, isDirectory: &isDirectory)
        
        /* ---------------------------------
         ** Check if the directory is empty.
         ** If not, we can only remove if
         ** `recursive` flag is true.
         */
        if isDirectory.boolValue {
            let contents = try self.fileManager.contentsOfDirectory(atPath: url.path)
            isEmpty      = contents.isEmpty
        }
        
        if fileExists {
            if !isDirectory.boolValue || isEmpty || (isDirectory.boolValue && recursive) {
                try self.fileManager.removeItem(at: url)
            } else {
                throw FileError.nonEmptyDirectory
            }
            
        } else {
            throw FileError.notFound
        }
    }
    
    // ----------------------------------
    //  MARK: - Links -
    //
    public static func ln(at linkPath: FilePath, source: FilePath, symbolic: Bool = false) throws {
        try self.ln(at: linkPath.fileURL, source: source.fileURL, symbolic: symbolic)
    }
    
    public static func ln(at linkURL: URL, source: URL, symbolic: Bool = false) throws {
        if symbolic {
            try self.fileManager.createSymbolicLink(at: linkURL, withDestinationURL: source)
        } else {
            try self.fileManager.linkItem(at: source, to: linkURL)
        }
    }
    
    // ----------------------------------
    //  MARK: - Touch -
    //
    public static func touch(_ path: FilePath, date: Date? = nil) throws {
        try self.touch(path.fileURL, date: date)
    }
    
    public static func touch(_ url: URL, date: Date? = nil) throws {
        let fileExists = self.fileManager.fileExists(atPath: url.path)
        if fileExists {
            
            let newDate    = date ?? Date()
            var mutableURL = url
            
            try mutableURL.setResourceValuesUsing { values in
                values.contentAccessDate       = newDate
                values.contentModificationDate = newDate
            }
            
        } else {
            try Data().write(to: url, options: .atomic)
        }
    }
    
    // ----------------------------------
    //  MARK: - Create Directory -
    //
    public static func mkdir(_ path: FilePath, createIntermediate: Bool = false) throws {
        try self.mkdir(path.fileURL, createIntermediate: createIntermediate)
    }
    
    public static func mkdir(_ url: URL, createIntermediate: Bool = false) throws {
        try self.fileManager.createDirectory(at: url, withIntermediateDirectories: createIntermediate, attributes: nil)
    }
    
    // ----------------------------------
    //  MARK: - Permissions -
    //
    public static func chmod(at path: FilePath) throws -> Permissions {
        return try self.chmod(at: path.fileURL)
    }
    
    public static func chmod(at url: URL) throws -> Permissions {
        let attributes = try self.fileManager.attributesOfItem(atPath: url.path)
        return Permissions(rawValue: attributes[FileAttributeKey.posixPermissions] as! Int)!
    }
    
    public static func chmod(at path: FilePath, permissions: Permissions) throws {
        try self.chmod(at: path.fileURL, permissions: permissions)
    }
    
    public static func chmod(at url: URL, permissions: Permissions) throws {
        try self.chmod(at: url, permissions: permissions.rawValue)
    }
    
    public static func chmod(at path: FilePath, permissions: Int) throws {
        try self.chmod(at: path.fileURL, permissions: permissions)
    }
    
    public static func chmod(at url: URL, permissions: Int) throws {
        try self.fileManager.setAttributes([
            FileAttributeKey.posixPermissions: permissions
        ], ofItemAtPath: url.path)
    }
    
    // ----------------------------------
    //  MARK: - List -
    //
    public static func ls(_ path: FilePath, options: ListOptions = .none) throws -> [FilePath] {
        return try self.ls(path.fileURL, options: options).map { $0.path }
    }
    
    public static func ls(_ url: URL, options: ListOptions = .none) throws -> [URL] {
        var enumerationOptions: FileManager.DirectoryEnumerationOptions = []
        
        if !options.contains(.recursive) {
            enumerationOptions.insert(.skipsSubdirectoryDescendants)
            enumerationOptions.insert(.skipsPackageDescendants)
        } else {
            if options.contains(.skipPackages) {
                enumerationOptions.insert(.skipsPackageDescendants)
            }
        }
        
        if !options.contains(.showHidden) {
            enumerationOptions.insert(.skipsHiddenFiles)
        }

        var encounteredError: Error?
        let enumerator = self.fileManager.enumerator(at: url, includingPropertiesForKeys: nil, options: enumerationOptions) { url, error in
            encounteredError = error
            return false
        }!
        
        let urls = enumerator.map {
            $0 as! URL
        }
        
        if let error = encounteredError {
            throw error
        }
        
        return urls
    }
}

public struct ListOptions: OptionSet {
    public var rawValue: Int
    
    public static let none         = ListOptions(rawValue: 0 << 0)
    public static let recursive    = ListOptions(rawValue: 1 << 1)
    public static let skipPackages = ListOptions(rawValue: 1 << 2)
    public static let showHidden   = ListOptions(rawValue: 1 << 3)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public enum FileError: Error {
    case notFound
    case nonEmptyDirectory
    case unknown
}

private extension URL {
    
    mutating func setResourceValuesUsing(handler: (inout URLResourceValues) -> Void) throws {
        var values = URLResourceValues()
        handler(&values)
        try self.setResourceValues(values)
    }
}