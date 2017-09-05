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
    
    public internal(set) var textColor:       TextColor?
    public internal(set) var backgroundColor: BackgroundColor?
    public internal(set) var styleAttributes: Set<Style>
    public internal(set) var escapeSequence:  EscapeSequence
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public init(textColor: TextColor? = nil, backgroundColor: BackgroundColor? = nil, styleAttributes: Set<Style> = [], escapeSequence: EscapeSequence? = nil) {
        self.textColor       = textColor
        self.backgroundColor = backgroundColor
        self.styleAttributes = styleAttributes
        self.escapeSequence  = escapeSequence ?? AttributeCollection.currentEscapeSequence
    }
    
    public static func clear() -> AttributeCollection {
        return AttributeCollection(styleAttributes: [Style.clear])
    }
    
    // ----------------------------------
    //  MARK: - Queries -
    //
    public var hasAttributes: Bool {
        if self.textColor != nil || self.backgroundColor != nil || !self.styleAttributes.isEmpty {
            return true
        }
        return false
    }
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        var attributes: [Attribute] = Array(self.styleAttributes)
        
        if let textColor = self.textColor {
            attributes.append(textColor)
        }
        
        if let backgroundColor = self.backgroundColor {
            attributes.append(backgroundColor)
        }
        
        return "\(self.escapeSequence)[\(attributes.stringRepresentation)m"
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
