//
//  StartSessionTimer.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import Domain

public struct SelectSessionTimerAction: Action {
    public let sessionTimer: SessionTimer
    
    public init(sessionTimer: SessionTimer) {
        self.sessionTimer = sessionTimer
    }
}
