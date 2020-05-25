//
//  SessionTimer.swift
//  Domain
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation

public struct SessionTimer {
    public let id: String
    public let name: String
    public let steps: [SessionStep]
    
    public init(
        id: String,
        name: String,
        steps: [SessionStep]) {
        
        self.id = id
        self.name = name
        self.steps = steps
    }
    
    public func copyWith(
        id: String? = nil,
        name: String? = nil,
        steps: [SessionStep]? = nil) -> SessionTimer {
        return SessionTimer(
            id: id ?? self.id,
            name: name ?? self.name,
            steps: steps ?? self.steps)
    }
}

extension SessionTimer: Equatable {
    public static func == (lhs: SessionTimer, rhs: SessionTimer) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.steps == rhs.steps
    }
}
