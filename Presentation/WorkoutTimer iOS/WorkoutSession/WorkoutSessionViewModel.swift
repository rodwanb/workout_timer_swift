//
//  WorkoutSessionViewModel.swift
//  WorkoutTimer iOS
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import Application

protocol WorkoutSessionViewModel: ObservableObject {
    var sessionName: String { get set }
    var remainingTime: Int { get set }
    func startTimer()
    func stopTimer()
    func restartTimer()
}

class DefaultWorkoutSessionViewModel: BaseViewModel, WorkoutSessionViewModel {
    @Published var remainingTime: Int = 0
    @Published var sessionName: String = ""
    
    init() {
        super.init()
        dispatch(AddSessionTimerAction(
            name: "MainTimer",
            steps: [
                AddSessionTimerStep(name: "countdown", duration: 5)
            ]))
        let currentSession = SessionTimerSelector.sessionTimers(store!.getState()).first!
        dispatch(SelectSessionTimerAction(sessionTimer: currentSession))
        dispatch(SelectSessionStepAction(sessionStep: currentSession.steps.first!))
    }
    
    override func mapStateToProps(state: ApplicationState) {
        remainingTime = SessionTimerSelector.currentSessionStep(state)?.duration ?? 0
        sessionName = SessionTimerSelector.currentSessionTimer(state)?.name ?? ""
    }
    
    func startTimer() {
        dispatch(StartTimerAction())
    }
    
    func stopTimer() {
        dispatch(StopTimerAction())
    }
    
    func restartTimer() {
        dispatch(RestartSessionTimerAction())
    }
}
