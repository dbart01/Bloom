//
//  Fragment.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public struct Fragment: CustomStringConvertible, CustomDebugStringConvertible {
    
    public let content:     String
    public let shouldClear: Bool
    
    public private(set) var attributes: AttributeCollection
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public init(_ content: String, attributeCollection: AttributeCollection = AttributeCollection(attributes: []), shouldClear: Bool = true) {
        self.content     = content
        self.attributes  = attributeCollection
        self.shouldClear = shouldClear
    }
    
    // ----------------------------------
    //  MARK: - Attributes -
    //
    public mutating func add(attribute: Attribute) {
        self.attributes.add(attribute: attribute)
    }
    
    public mutating func remove(attribute: Attribute) {
        self.attributes.remove(attribute: attribute)
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        if attributes.hasAttributes {
            return self.content
        } else {
            
            var clearString = ""
            if self.shouldClear {
                clearString = AttributeCollection.clear().description
            }
            
            return "\(self.attributes)\(self.content)\(clearString)"
        }
    }
    
    public var debugDescription: String {
        return self.description
    }
}
