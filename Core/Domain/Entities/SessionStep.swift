//
//  SessionStep.swift
//  Application
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation

public struct SessionStep {
    public let id: String
    public let name: String
    public let duration: Int
    
    public init(id: String, name: String, duration: Int) {
        self.id = id
        self.name = name
        self.duration = duration
    }
    
    public func copyWith(
        id: String? = nil,
        name: String? = nil,
        duration: Int? = nil) -> SessionStep {
        return SessionStep(
            id: id ?? self.id,
            name: name ?? self.name,
            duration: duration ?? self.duration)
    }
}

extension SessionStep: Equatable {
    public static func == (lhs: SessionStep, rhs: SessionStep) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.duration == rhs.duration
    }
}
