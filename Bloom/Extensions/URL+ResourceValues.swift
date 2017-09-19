//
//  URL+ResourceValues.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-09-19.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension URL {
    
    mutating func setResourceValuesUsing(handler: (inout URLResourceValues) -> Void) throws {
        var values = URLResourceValues()
        handler(&values)
        try self.setResourceValues(values)
    }
}
