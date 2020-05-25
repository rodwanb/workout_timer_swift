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
    public let countDown: Int
    
    public init(id: String, name: String, countDown: Int) {
        self.id = id
        self.name = name
        self.countDown = countDown
    }
    
    public func copyWith(
        id: String? = nil,
        name: String? = nil,
        countDown: Int? = nil) -> SessionTimer {
        return SessionTimer(
            id: id ?? self.id,
            name: name ?? self.name,
            countDown: countDown ?? self.countDown)
    }
}

extension SessionTimer: Equatable {
    public static func == (lhs: SessionTimer, rhs: SessionTimer) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.countDown == rhs.countDown
    }
}
