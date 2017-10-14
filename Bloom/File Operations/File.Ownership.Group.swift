//
//  File.Ownership.Group.swift
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

public extension File.Ownership {
    public struct Group: OwnerType {
        
        public let id: Int
        public let name: String
        
        // ----------------------------------
        //  MARK: - Init -
        //
        public init?(id: Int) {
            guard let name = Group.name(for: id) else {
                return nil
            }
            
            self.id   = id
            self.name = name
        }
        
        public init?(name: String) {
            guard let id = Group.id(for: name) else {
                return nil
            }
            
            self.id   = id
            self.name = name
        }
        
        // ----------------------------------
        //  MARK: - Lookup -
        //
        public static func id(for name: String) -> Int? {
            if let pointer = getgrnam(name) {
                return Int(pointer.pointee.gr_gid)
            }
            return nil
        }
        
        public static func name(for id: Int) -> String? {
            if let pointer = getgrgid(UInt32(id)) {
                return String(cString: pointer.pointee.gr_name)
            }
            return nil
        }
        
        // ----------------------------------
        //  MARK: - List -
        //
        static func listAll() -> Set<Group> {
            var container: Set<Group> = []
            while let passwd = getgrent() {
                let id = Int(passwd.pointee.gr_gid)
                if let user = Group(id: id) {
                    container.insert(user)
                }
            }
            setgrent()
            endgrent()
            return container
        }
    }
}
