//
//  ApplicationReducer.swift
//  Application
//
//  Created by Rodwan on 2020/05/22.
//

import Foundation

final class ApplicationReducer {
    static func reduce(state: ApplicationState, action: Action) -> ApplicationState {
        return ApplicationState(
            sessionTimerState: SessionTimerReducer.reduce(state.sessionTimerState, action: action))
    }
}
