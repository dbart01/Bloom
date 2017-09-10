//
//  AttributeCollection.swift
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

public struct AttributeCollection: CustomStringConvertible, CustomDebugStringConvertible, Equatable {
    
    public internal(set) var textColor:       TextColor?
    public internal(set) var backgroundColor: BackgroundColor?
    public internal(set) var styleAttributes: Set<Style>
    
    // ----------------------------------
    //  MARK: - Init -
    //
    public init(textColor: TextColor? = nil, backgroundColor: BackgroundColor? = nil, styleAttributes: Set<Style> = []) {
        self.textColor       = textColor
        self.backgroundColor = backgroundColor
        self.styleAttributes = styleAttributes
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
        
        return "\(EscapeSequence)[\(attributes.stringRepresentation)m"
    }
    
    public var debugDescription: String {
        return self.description
    }
}

// ----------------------------------
//  MARK: - Equatable -
//
extension AttributeCollection {
    public static func ==(lhs: AttributeCollection, rhs: AttributeCollection) -> Bool {
        return lhs.textColor    == rhs.textColor &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.styleAttributes == rhs.styleAttributes
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
