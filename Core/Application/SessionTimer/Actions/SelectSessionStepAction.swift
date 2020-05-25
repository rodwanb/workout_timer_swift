//
//  SelectSessionStepAction.swift
//  Application
//
//  Created by Rodwan on 2020/05/25.
//

import Foundation
import Domain

public struct SelectSessionStepAction: Action {
    public let sessionStep: SessionStep?
    
    public init(sessionStep: SessionStep?) {
        self.sessionStep = sessionStep
    }
}
