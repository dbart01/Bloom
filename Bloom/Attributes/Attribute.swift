//
//  Attribute.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public protocol Attribute {
    var value: Int { get }
}

public extension RawRepresentable where Self.RawValue == Int {
    public var value: Int {
        return self.rawValue
    }
}

//public extension Attribute {
//    var hashValue: Int {
//        return self.value
//    }
//    
//    static func ==(lhs: Attribute, rhs: Attribute) -> Bool {
//        return lhs.value == rhs.value
//    }
//}

