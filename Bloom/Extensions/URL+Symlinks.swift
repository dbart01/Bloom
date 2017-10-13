//
//  URL+Symlinks.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-10-13.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension URL {
    
    // ----------------------------------
    //  MARK: - Symlinks -
    //
    mutating func resolveSymlinks() {
        self = self.resolvingSymlinks()
    }
    
    func resolvingSymlinks() -> URL {
        return File.resolveSymlinksIn(self)
    }
}
