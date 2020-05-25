//
//  SessionTimerMiddleware.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation
import RxSwift

public final class SessionTimerTickMiddleware {
    
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
                
                if let currentStep = SessionTimerSelector.currentSessionStep(self.store.getState()),
                    currentStep.duration == 0 {
                    self.store.dispatch(StopTimerAction())
                }
            })
            .disposed(by: disposeBag)
    }
}

