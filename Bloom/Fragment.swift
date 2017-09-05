//
//  Fragment.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public final class Fragment: CustomStringConvertible, CustomDebugStringConvertible, ExpressibleByStringLiteral {
    
    public let content:     String
    public let shouldClear: Bool
    
    public internal(set) var attributes: AttributeCollection
    
    private var parent: Fragment?
    
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
    public required init(stringLiteral value: StringLiteralType) {
        self.content     = String(value)
        self.attributes  = AttributeCollection()
        self.shouldClear = true
    }
    
    public required init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.content     = String(value)
        self.attributes  = AttributeCollection()
        self.shouldClear = true
    }
    
    public required init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.content     = String(value)
        self.attributes  = AttributeCollection()
        self.shouldClear = true
    }
    
    // ----------------------------------
    //  MARK: - Attributes -
    //
//    public func add(attribute: Attribute) {
//        self.attributes.add(attribute: attribute)
//    }
//    
//    public func remove(attribute: Attribute) {
//        self.attributes.remove(attribute: attribute)
//    }
    
    // ----------------------------------
    //  MARK: - Fragments -
    //
    internal func appending(_ fragment: Fragment) -> Fragment {
        fragment.parent = self
        return fragment
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
        
        if let parentDescription = self.parent?.description {
            return "\(parentDescription)\(description)"
        } else {
            return description
        }
    }
    
    public var debugDescription: String {
        return self.description
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
