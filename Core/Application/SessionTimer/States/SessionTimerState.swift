//
//  SessionTimerState.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import Domain

struct SessionTimerState {
    let sessionTimers: [SessionTimer]
    let currentSessionTimer: SessionTimer?
    
    static func initial() -> SessionTimerState {
        return SessionTimerState(sessionTimers: [], currentSessionTimer: nil)
    }
}

extension SessionTimerState: Equatable {
    static func == (lhs: SessionTimerState, rhs: SessionTimerState) -> Bool {
        return lhs.sessionTimers.elementsEqual(rhs.sessionTimers) &&
            lhs.currentSessionTimer == rhs.currentSessionTimer
    }
}
