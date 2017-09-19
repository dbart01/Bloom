//
//  File.OperationError.swift
//  Bloom iOS
//
//  Created by Dima Bart on 2017-09-19.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension File {
    public enum OperationError: Error {
        case notFound
        case nonEmptyDirectory
        case unknown
    }
}
