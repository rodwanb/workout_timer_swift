//
//  BaseViewModel.swift
//  WorkoutTimer iOS
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import Application
import RxSwift

class BaseViewModel {
    let dispatch: (_ action: Action) -> Void
    private let disposeBag = DisposeBag()

    init(store: Store = store!) {
        self.dispatch = store.dispatch
        
        mapDispatchToProps(dispatch: store.dispatch)
        
        store.state
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
                guard let self = self else { return }
                self.mapStateToProps(state: state)
            })
            .disposed(by: disposeBag)
    }
    
    func mapStateToProps(state: ApplicationState) {
        // override
    }
    
    func mapDispatchToProps(dispatch: @escaping (_ action: Action) -> Void) {
        //override
    }
}
