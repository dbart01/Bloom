//
//  File.ListOptions.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-09-19.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension File {
    public struct ListOptions: OptionSet {
        public var rawValue: Int
        
        public static let none         = ListOptions(rawValue: 0 << 0)
        public static let recursive    = ListOptions(rawValue: 1 << 1)
        public static let skipPackages = ListOptions(rawValue: 1 << 2)
        public static let hidden       = ListOptions(rawValue: 1 << 3)
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
