//
//  ApplicationState.swift
//  Application
//
//  Created by Rodwan on 2020/05/22.
//

import Foundation

public struct ApplicationState {
    
    let sessionTimerState: SessionTimerState
    
    static func initial() -> ApplicationState {
        return ApplicationState(sessionTimerState: SessionTimerState.initial())
    }
}

extension ApplicationState: Equatable {
    public static func == (lhs: ApplicationState, rhs: ApplicationState) -> Bool {
        return lhs.sessionTimerState == rhs.sessionTimerState
    }
}
