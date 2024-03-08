//
//  ToDoItem.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import Foundation

struct ToDoItem: Identifiable {
    let id: UUID
    var name: String
    var isCompleted: Bool
    let dateCreated: Date

    init(id: UUID = UUID(), name: String, isCompleted: Bool = false, dateCreated: Date = Date()) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
        self.dateCreated = dateCreated
    }
}

