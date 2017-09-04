//
//  EscapeSequence.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public enum EscapeSequence: String, CustomStringConvertible, CustomDebugStringConvertible {
    
    case `default` = "\u{001B}"
    
    // ----------------------------------
    //  MARK: - Description -
    //
    public var description: String {
        return self.rawValue
    }
    
    public var debugDescription: String {
        return self.description
    }
}
