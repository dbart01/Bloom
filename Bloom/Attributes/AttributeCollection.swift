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
    
    public let escapeSequence: EscapeSequence
    public private(set) var attributes: [Attribute]
    
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
    public var hasAttributes: Bool {
        return !self.attributes.isEmpty
    }
    
    // ----------------------------------
    //  MARK: - Attributes -
    //
    public mutating func add(attribute: Attribute) {
        if let index = self.index(of: attribute) {
            self.attributes.remove(at: index)
            self.attributes.insert(attribute, at: index)
        } else {
            self.attributes.append(attribute)
        }
    }
    
    public mutating func remove(attribute: Attribute) {
        if let index = self.index(of: attribute) {
            self.attributes.remove(at: index)
        }
    }
    
    private func index(of attribute: Attribute) -> Int? {
        for (index, currentAttribute) in self.attributes.enumerated() {
            if currentAttribute.value == attribute.value {
                return index
            }
        }
        return nil
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
