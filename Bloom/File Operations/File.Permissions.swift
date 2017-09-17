//
//  File.Permissions.swift
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

extension File {
    public struct Permissions: RawRepresentable {
        
        public var user:  Scope
        public var group: Scope
        public var other: Scope
        
        // ----------------------------------
        //  MARK: - Init -
        //
        public init(user: Scope, group: Scope, other: Scope) {
            self.user  = user
            self.group = group
            self.other = other
        }
        
        // ----------------------------------
        //  MARK: - RawRepresentable -
        //
        public typealias RawValue = Int
        
        public var rawValue: Int {
            return
                self.user.rawValue  << 6 |
                self.group.rawValue << 3 |
                self.other.rawValue << 0
        }
        
        public init?(rawValue: Int) {
            self.init(
                user:  Scope(rawValue: rawValue >> 6 & 0o7),
                group: Scope(rawValue: rawValue >> 3 & 0o7),
                other: Scope(rawValue: rawValue >> 0 & 0o7)
            )
        }
    }
}

// ----------------------------------
//  MARK: - Scope -
//
extension File.Permissions {
    public struct Scope: OptionSet {
        
        public let rawValue: Int
        
        public static let none    = Scope(rawValue: 0 << 0)
        public static let read    = Scope(rawValue: 1 << 2)
        public static let write   = Scope(rawValue: 1 << 1)
        public static let execute = Scope(rawValue: 1 << 0)
        
        func can(_ scopeOperation: Scope) -> Bool {
            return self.contains(scopeOperation)
        }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
