//
//  RestartSessionSessionMiddleware.swift
//  Application
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import RxSwift

public final class RestartSessionSessionMiddleware {
    
    private let store: Store
    private let disposeBag = DisposeBag()
    
    public init(store: Store) {
        self.store = store
        
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
                self.store.dispatch(SelectSessionStepAction(sessionStep: originalSession.steps.first))
            })
            .disposed(by: disposeBag)
    }
}
