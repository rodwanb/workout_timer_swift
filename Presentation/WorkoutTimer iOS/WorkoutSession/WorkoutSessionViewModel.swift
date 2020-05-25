//
//  WorkoutSessionViewModel.swift
//  WorkoutTimer iOS
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import Application

protocol WorkoutSessionViewModel: ObservableObject {
    var remainingTime: Int { get set }
    func startTimer()
    func stopTimer()
    func restartTimer()
}

class DefaultWorkoutSessionViewModel: BaseViewModel, WorkoutSessionViewModel {
    @Published var remainingTime: Int = 0
    
    init() {
        super.init()
        dispatch(AddSessionTimerAction(name: "MainTimer", countDown: 20))
        dispatch(SelectSessionTimerAction(sessionTimer: SessionTimerSelector.sessionTimers(store!.getState()).first!))
    }
    
    override func mapStateToProps(state: ApplicationState) {
        remainingTime = SessionTimerSelector.currentSessionTimer(state)?.countDown ?? 0
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
