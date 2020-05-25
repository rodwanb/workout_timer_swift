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
            sessionTimers: reduceSessionTimers(state.sessionTimers, action: action),
            currentSessionTimer: reduceCurrentSessionTimer(state.currentSessionTimer, action: action),
            currentSessionStep: reduceCurrentStep(state.currentSessionStep, action: action))
    }
    
    private static func reduceSessionTimers(_ state: [SessionTimer], action: Action) -> [SessionTimer] {
        switch action {
        case let addAction as AddSessionTimerAction:
            let newSessionTimer = SessionTimer(
                id: UUID().uuidString,
                name: addAction.name,
                steps: addAction.steps.map({ step in
                    return SessionStep(
                        id: UUID().uuidString,
                        name: step.name,
                        duration: step.duration)
                }))
            return state + [newSessionTimer]
        default:
            return state
        }
    }
    
    private static func reduceCurrentSessionTimer(_ state: SessionTimer?, action: Action) -> SessionTimer? {
        switch action {
        case let selectAction as SelectSessionTimerAction:
            return selectAction.sessionTimer
        default:
            return state
        }
    }
    
    private static func reduceCurrentStep(_ state: SessionStep?, action: Action) -> SessionStep? {
        switch action {
        case let selectAction as SelectSessionStepAction:
            return selectAction.sessionStep
        case is TimerTickAction:
            guard let currentSession = state else {
                return state
            }
            let newDuration = currentSession.duration < 1 ? 0 : currentSession.duration - 1
            return currentSession.copyWith(duration: newDuration)
        default:
            return state
        }
    }
}
