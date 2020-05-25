//
//  AddSessionTimerAction.swift
//  Application
//
//  Created by Rodwan on 2020/05/24.
//

import Foundation

public struct AddSessionTimerAction: Action {
    public let name: String
    public let countDown: Int

    public init(name: String, countDown: Int) {
        self.name = name
        self.countDown = countDown
    }
}
