//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 19.06.2021.
//

import Foundation

public struct TSDKKitError: Error, CustomStringConvertible {

    public enum Types {
        case error
    }

    private let title: String = "TSDKKitError"

    public var type:        Types
    public var reason:      String
    public var description: String { "[\(title)] \(type) \(reason)" }

    public init (_ type: Types = .error, reason: String = "") {
        self.type = type
        self.reason = reason
    }

    public init (_ reason: String) {
        self.type = .error
        self.reason = reason
    }
}
