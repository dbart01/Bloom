//
//  Execute.swift
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

public enum Execute {
    
    // ----------------------------------
    //  MARK: - Command -
    //
    @discardableResult
    public static func command(_ path: FilePath, searchPath: Path = .system, args: String ...) throws -> Subprocess {
        var packageURL = path.fileURL
        
        if !File.exists(packageURL).fileExists {
            guard let resolvedURL = self.resolvePackage(path, in: searchPath) else {
                throw Error.packageNotFound
            }
            
            packageURL = resolvedURL
        }
        
        return self.command(packageURL, args: args)
    }
    
    @discardableResult
    public static func command(_ url: URL, args: String ...) -> Subprocess {
        return self.command(url, args: args)
    }
    
    @discardableResult
    internal static func command(_ url: URL, args: [String]) -> Subprocess {
        let subprocess = Subprocess(command: url, args: args)
        try! subprocess.launchAndWait()
        return subprocess
    }
    
    // ----------------------------------
    //  MARK: - Resolve -
    //
    internal static func resolvePackage(_ name: String, in searchPath: Path) -> URL? {
        for url in searchPath.urls {
            let packageURL = url.appendingPathComponent(name)
            if File.exists(packageURL).fileExists {
                return packageURL
            }
        }
        
        return nil
    }
}

// ----------------------------------
//  MARK: - Error -
//
public extension Execute {
    public enum Error: Swift.Error {
        case packageNotFound
    }
}
