//
//  AttributeCollection.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public struct AttributeCollection: CustomStringConvertible, CustomDebugStringConvertible {
    
    public static var currentEscapeSequence: EscapeSequence = .default
    
    public let attributes:     [Attribute]
    public let escapeSequence: EscapeSequence
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public init(attributes: [Attribute], escapeSequence: EscapeSequence? = nil) {
        self.attributes     = attributes
        self.escapeSequence = escapeSequence ?? AttributeCollection.currentEscapeSequence
    }
    
    public static func clear() -> AttributeCollection {
        return AttributeCollection(attributes: [Style.clear])
    }
    
    // ----------------------------------
    //  MARK: - Queries -
    //
    public func hasAttributes() -> Bool {
        return !self.attributes.isEmpty
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        return "\(self.escapeSequence)[\(self.attributes.stringRepresentation)m"
    }
    
    public var debugDescription: String {
        return self.description
    }
}

// ----------------------------------
//  MARK: - Attribute Strings -
//
private extension Array where Element == Attribute {
    var stringRepresentation: String {
        return self.map { "\($0.value)" }.joined(separator: ";")
    }
}
