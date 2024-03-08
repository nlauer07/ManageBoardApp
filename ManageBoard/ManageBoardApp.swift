//
//  ManageBoardApp.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import SwiftUI

@main
struct ManageBoardApp: App {
    @StateObject private var toDoListManager = ToDoListManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toDoListManager)
        }
    }
}
