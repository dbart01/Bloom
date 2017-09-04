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
    public let attributes:  AttributeCollection
    public let shouldClear: Bool
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public init(_ content: String, attributeCollection: AttributeCollection = AttributeCollection(attributes: []), shouldClear: Bool = true) {
        self.content     = content
        self.attributes  = attributeCollection
        self.shouldClear = shouldClear
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        if attributes.isEmpty {
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
