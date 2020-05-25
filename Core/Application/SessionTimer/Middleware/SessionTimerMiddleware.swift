//
//  SessionTimerMiddleware.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import RxSwift

public final class SessionTimerMiddleware {
    
    private let store: Store
    private let disposeBag = DisposeBag()
    
    public init(store: Store) {
        self.store = store
        
        _ = self.store.action
            .filter { $0 is TimerTickAction }
            .compactMap { $0 }
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] action in
                guard let self = self, case is TimerTickAction = action else {
                    return
                }
                
                if let currentSession = SessionTimerSelector.currentSessionTimer(self.store.getState()),
                    currentSession.countDown == 0 {
                    self.store.dispatch(StopTimerAction())
                }
            })
            .disposed(by: disposeBag)
        
        _ = self.store.action
        .filter { $0 is RestartSessionTimerAction }
        .compactMap { $0 }
        .observeOn(MainScheduler.asyncInstance)
        .subscribe(onNext: { [weak self] action in
            guard let self = self,
                case is RestartSessionTimerAction = action,
                let currentSession = SessionTimerSelector.currentSessionTimer(self.store.getState()),
                let originalSession = SessionTimerSelector.sessionTimer(self.store.getState(), id: currentSession.id) else {
                return
            }
            
            self.store.dispatch(SelectSessionTimerAction(sessionTimer: originalSession))
        })
        .disposed(by: disposeBag)
    }
}

