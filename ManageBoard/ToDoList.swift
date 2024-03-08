//
//  ToDoList.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import Foundation

class ToDoList: Identifiable {
    let id = UUID()
    var name: String
    var items: [ToDoItem]
    var sortType: SortType

    init(name: String, items: [ToDoItem] = [], sortType: SortType = .alphabetical) {
        self.name = name
        self.items = items
        self.sortType = sortType
    }
    
    func sortItems() {
        switch sortType {
        case .alphabetical:
            items.sort { $0.name.localizedCompare($1.name) == .orderedAscending }
        case .dateCreated:
            items.sort { $0.dateCreated < $1.dateCreated }
        // Add cases for other SortType values here
        // Example for a case that hasn't been implemented yet:
        // case .dueDate, .priority:
        //     break // Placeholder until implemented
        default:
            // Handle any unimplemented cases or provide a fallback sorting strategy
            break
        }
    }
}
