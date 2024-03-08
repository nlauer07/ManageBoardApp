//
//  ToDoListManager.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import Foundation

class ToDoListManager: ObservableObject {
    @Published var lists: [ToDoList] = []

    init() {
        // Initializer can load existing to-do lists from storage or start with empty/default lists
    }

    func addList(_ list: ToDoList) {
        lists.append(list)
    }

    func removeList(at index: Int) {
        lists.remove(at: index)
    }

    // Additional functions for managing and sorting lists or items can be added here
}
