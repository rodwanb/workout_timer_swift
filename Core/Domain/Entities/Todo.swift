//
//  Todo.swift
//  Domain
//
//  Created by Rodwan on 2020/05/22.
//

import Foundation

public struct Todo {
    
    public let id: String
    public let name: String
    public let description: String
    public let status: TodoStatus
    
    public init(
        id: String,
        name: String,
        description: String,
        status: TodoStatus) {
        
        self.id = id
        self.name = name
        self.description = description
        self.status = status
    }
}

extension Todo: Equatable {
    public static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.status == rhs.status
    }
}
