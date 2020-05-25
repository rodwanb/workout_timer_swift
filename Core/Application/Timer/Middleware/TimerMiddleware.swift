//
//  TimerMiddleware.swift
//  Application
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import RxSwift

public final class TimerMiddleware {
    
    private let store: Store
    private let disposeBag = DisposeBag()
    private var timerSubscription: Disposable? = nil
    
    public init(store: Store) {
        self.store = store
        _ = store.action
            .filter { $0 is StartTimerAction || $0 is StopTimerAction }
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                switch action {
                case is StartTimerAction:
                    self.startTimer()
                case is StopTimerAction:
                    self.stopTimer()
                default:
                    return
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func startTimer() {
        guard self.timerSubscription == nil else {
            return
        }
        
        self.timerSubscription = Observable<Int>
            .interval(
                RxTimeInterval.seconds(1),
                scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                self?.store.dispatch(TimerTickAction())
            })
    }
    
    private func stopTimer() {
        self.timerSubscription?.dispose()
        self.timerSubscription = nil
    }
}
