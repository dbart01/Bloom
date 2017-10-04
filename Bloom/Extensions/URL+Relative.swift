//
//  URL+Relative.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-10-03.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension URL {
    
    // ----------------------------------
    //  MARK: - Init -
    //
    init?(fileURLWithComponents components: [String]) {
        guard components.count > 0 else {
            return nil
        }
        
        self.init(fileURLWithPath: components[0])
        
        for i in 1..<components.count {
            self.appendPathComponent(components[i])
        }
    }
    
    // ----------------------------------
    //  MARK: - Directory -
    //
    func directoryURL() -> URL {
        if !self.hasDirectoryPath {
            return self.deletingLastPathComponent()
        }
        return self
    }
    
    // ----------------------------------
    //  MARK: - Relative Path -
    //
    func relativePath(to url: URL) -> URL? {
        let fromURL        = self.directoryURL()
        let fromComponents = fromURL.pathComponents
        let toComponents   = url.pathComponents
        
        for i in 0..<max(fromComponents.count, toComponents.count) {
            let fromC = i < fromComponents.count ? fromComponents[i] : nil
            let toC   = i < toComponents.count   ? toComponents[i]   : nil
            
            guard fromC != toC else {
                continue
            }
            
            var components: [String] = []
            
            if (fromC == nil || toC == nil) || (fromC != nil && toC != nil) { // Destination is 1+ levels higher or lower
                components = fromComponents[i...].map { _ in ".." }
            } else { // Same directory
                components.append(".")
            }
            components.append(contentsOf: toComponents[i...])
            
            return URL(fileURLWithComponents: components)
        }
        
        return self
    }
}
