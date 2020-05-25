//
//  AddSessionTimerAction.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation

public struct AddSessionTimerAction: Action {
    public let name: String
    public let steps: [AddSessionTimerStep]

    public init(name: String, steps: [AddSessionTimerStep]) {
        self.name = name
        self.steps = steps
    }
}

public struct AddSessionTimerStep {
    public let name: String
    public let duration: Int
    
    public init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
    }
}
