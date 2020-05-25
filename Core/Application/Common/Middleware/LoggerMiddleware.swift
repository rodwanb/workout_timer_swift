//
//  LoggerMiddleware.swift
//  Application
//
//  Created by Rodwan on 2020/05/22.
//

import Foundation
import RxSwift

public final class LoggerMiddleware {
    private let store: Store
    private let disposeBag: DisposeBag
    
    public init(store: Store) {
        self.store = store
        self.disposeBag = DisposeBag()
        
        _ = self.store.action
            .map({ action -> (Action, ApplicationState) in
                return (action, self.store.getState())
            })
//            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (action, state) in
                print("ACTION: \(action), STATE:\(state)")
            })
    }
}
