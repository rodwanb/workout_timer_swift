//
//  SessionTimerReducer.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import Domain

final class SessionTimerReducer {
    private init() {}
    
    static func reduce(_ state: SessionTimerState, action: Action) -> SessionTimerState {
        return SessionTimerState(
            sessionTimers: reduce(state.sessionTimers, action: action),
            currentSessionTimer: reduce(state.currentSessionTimer, action: action))
    }
    
    private static func reduce(_ state: [SessionTimer], action: Action) -> [SessionTimer] {
        switch action {
        case let addAction as AddSessionTimerAction:
            let newSessionTimer = SessionTimer(
                id: UUID().uuidString,
                name: addAction.name,
                countDown: addAction.countDown)
            return state + [newSessionTimer]
        default:
            return state
        }
    }
    
    private static func reduce(_ state: SessionTimer?, action: Action) -> SessionTimer? {
        switch action {
        case let selectAction as SelectSessionTimerAction:
            return selectAction.sessionTimer
        case is TimerTickAction:
            guard let currentSession = state else {
                return state
            }
            let newCountdown = currentSession.countDown < 1 ? 0 : currentSession.countDown - 1
            return currentSession.copyWith(countDown: newCountdown)
        default:
            return state
        }
    }
}
