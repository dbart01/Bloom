//
//  Fragment.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
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
