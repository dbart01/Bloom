//
//  Execute.Subprocess.swift
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

public extension Execute {
    public class Subprocess {
        
        public typealias SubprocessCompletion = (Subprocess) -> Void
        
        public private(set) var state:  State  = .ready
        public private(set) var status: Status = .ok
        
        public let command: URL
        public let args:    [String]?
        
        private let outPipe   = Pipe()
        private let errorPipe = Pipe()
        private let process   = Process()
        
        private let outHandle:   FileHandle
        private let errorHandle: FileHandle
        
        // ----------------------------------
        //  MARK: - Init -
        //
        public init(command: URL, args: [String]? = nil, completion: SubprocessCompletion? = nil) {
            self.command     = command
            self.args        = (args?.count ?? 0) > 0 ? args : nil
            
            self.outHandle   = self.outPipe.fileHandleForReading
            self.errorHandle = self.errorPipe.fileHandleForReading
            
            self.configureProcess()
            
            self.process.terminationHandler = { [weak self] process in
                if let strongSelf = self {
                    strongSelf.didFinish(process)
                    completion?(strongSelf)
                }
            }
        }
        
        private func configureProcess() {
            if #available(OSX 10.13, *) {
                self.process.executableURL = self.command
            } else {
                self.process.launchPath = self.command.path
            }
            
            self.process.arguments      = self.args ?? []
            self.process.standardOutput = self.outPipe
            self.process.standardError  = self.errorPipe
        }
        
        // ----------------------------------
        //  MARK: - Launch -
        //
        public func launchAndWait() throws {
            try self.launch()
            try self.wait()
        }
        
        public func launch() throws {
            try self.verifyNotLaunched()
            
            self.state = .running
            self.process.launch()
        }
        
        public func wait() throws {
            try self.verifySubprocessLaunched()
            
            self.process.waitUntilExit()
            self.didFinish(self.process)
        }
        
        // ----------------------------------
        //  MARK: - Accessing Data -
        //
        private lazy var _outData: Data = {
            return self.outHandle.readDataToEndOfFile()
        }()
        
        private lazy var _errorData: Data = {
            return self.errorHandle.readDataToEndOfFile()
        }()
        
        public func outData() throws -> Data {
            try self.verifySubprocessLaunched()
            return self._outData
        }
        
        public func errorData() throws -> Data {
            try self.verifySubprocessLaunched()
            return self._errorData
        }
        
        public func outString() throws -> String {
            return try self.outData().stringUsingUTF8
        }
        
        public func errorString() throws -> String {
            return try self.errorData().stringUsingUTF8
        }
        
        // ----------------------------------
        //  MARK: - Exceptions -
        //
        private func verifySubprocessLaunched() throws {
            guard self.state != .ready else {
                throw Error.notLaunched
            }
        }
        
        private func verifyNotLaunched() throws {
            guard self.state == .ready else {
                throw Error.alreadyRunning
            }
        }
        
        // ----------------------------------
        //  MARK: - Process -
        //
        private func didFinish(_ subprocess: Process) {
            if self.state != .finished {
                self.state = .finished
                
                let code = Int(subprocess.terminationStatus)
                if code == 0 {
                    self.status = .ok
                } else {
                    self.status = .error(code)
                }
            }
        }
    }
}

// ----------------------------------
//  MARK: - Error -
//
public extension Execute.Subprocess {
    public enum Error: Swift.Error {
        case notLaunched
        case alreadyRunning
    }
}

// ----------------------------------
//  MARK: - State -
//
public extension Execute.Subprocess {
    public enum State {
        case ready
        case running
        case finished
    }
}

// ----------------------------------
//  MARK: - String -
//
private extension Data {
    var stringUsingUTF8: String {
        return String(data: self, encoding: .utf8)!
    }
}
