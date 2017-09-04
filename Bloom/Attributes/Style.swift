//
//  Style.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

public enum Style: Int, Attribute {
    case clear      = 0
    case bold       = 1
    case dimmed     = 2
    case underlined = 4
    case blinking   = 5
    case inverted   = 7
    case hidden     = 8
}
