//
//  Store.swift
//  Application
//
//  Created by Rodwan on 2020/05/22.
//

import Foundation
import RxSwift

public final class Store {
    
    private let actionSubject: PublishSubject<Action>
    private let stateSubject: BehaviorSubject<ApplicationState>
    private let disposeBag: DisposeBag
    
    public var state: Observable<ApplicationState> {
        get {
            return stateSubject.asObserver()
        }
    }
    
    public var action: Observable<Action> {
        get {
            return actionSubject.asObserver()
        }
    }
    
    public init() {
        actionSubject = PublishSubject<Action>()
        stateSubject = BehaviorSubject<ApplicationState>(value: ApplicationState.initial())
        disposeBag = DisposeBag()
        
        _ = actionSubject
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                self.stateSubject.onNext(ApplicationReducer.reduce(state: self.getState(), action: action))
            })
            .disposed(by: disposeBag)
    }
    
    public func dispatch(_ action: Action) {
        actionSubject.onNext(action)
    }
    
    public func getState() -> ApplicationState {
        do {
            return try self.stateSubject.value()
        } catch {
            return ApplicationState.initial()
        }
    }
}
