//
//  SessionTimerSelector.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import Domain

public final class SessionTimerSelector {
    private init() {}
    
    public static func sessionTimers(_ state: ApplicationState) -> [SessionTimer] {
        return state.sessionTimerState.sessionTimers
    }
    
    public static func sessionTimer(_ state: ApplicationState, id: String) -> SessionTimer? {
        return sessionTimers(state)
            .first { $0.id == id }
    }
    
    public static func currentSessionTimer(_ state: ApplicationState) -> SessionTimer? {
        return state.sessionTimerState.currentSessionTimer
    }
}
