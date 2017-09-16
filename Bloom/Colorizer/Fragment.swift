//
//  Fragment.swift
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

public final class Fragment: CustomStringConvertible, CustomDebugStringConvertible, ExpressibleByStringLiteral, Equatable {
    
    public let content:     String
    public let shouldClear: Bool
    
    public internal(set) var attributes: AttributeCollection
    
    internal private(set) var parent: Fragment?
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public required init(_ content: String, attributeCollection: AttributeCollection = AttributeCollection(), shouldClear: Bool = true) {
        self.content     = content
        self.attributes  = attributeCollection
        self.shouldClear = shouldClear
    }
    
    // ----------------------------------
    //  MARK: - ExpressibleByStringLiteral -
    //
    public convenience init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    // ----------------------------------
    //  MARK: - Fragments -
    //
    internal func appending(_ fragment: Fragment) -> Fragment {
        let copy    = Fragment(fragment.content, attributeCollection: fragment.attributes, shouldClear: fragment.shouldClear)
        copy.parent = self
        return copy
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        let description: String
        
        if !attributes.hasAttributes {
            description = self.content
        } else {
            
            var clearString = ""
            if self.shouldClear {
                clearString = AttributeCollection.clear().description
            }
            description = "\(self.attributes)\(self.content)\(clearString)"
        }
        
        guard let parentDescription = self.parent?.description else {
            return description
        }
        return "\(parentDescription)\(description)"
    }
    
    public var debugDescription: String {
        return self.description
    }
}

// ----------------------------------
//  MARK: - Equatable -
//
extension Fragment {
    public static func ==(lhs: Fragment, rhs: Fragment) -> Bool {
        return lhs.content  == rhs.content &&
            lhs.shouldClear == rhs.shouldClear &&
            lhs.attributes  == rhs.attributes &&
            lhs.parent      == rhs.parent
    }
}

// ----------------------------------
//  MARK: - Operators -
//
extension Fragment {
    public static func +(lhs: Fragment, rhs: Fragment) -> Fragment {
        return lhs.appending(rhs)
    }
    
    public static func +(lhs: Fragment, rhs: String) -> Fragment {
        return lhs + Fragment(rhs)
    }
}
