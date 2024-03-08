//
//  ContentView.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: ToDoListManager
    @State private var showingAddListView = false // Track whether the add list view is shown

    var body: some View {
        NavigationView {
            List {
                ForEach(manager.lists.indices, id: \.self) { index in
                    NavigationLink(destination: ToDoListView(toDoList: $manager.lists[index])) {
                        Text(manager.lists[index].name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("To-Do Lists")
            .toolbar {
                Button(action: {
                    showingAddListView = true // Show the add list view
                }) {
                    Image(systemName: "plus")
                }
            }
            // Present the add new list view as a sheet
            .sheet(isPresented: $showingAddListView) {
                AddListView(isPresented: $showingAddListView) // Pass the binding to manage presentation
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        manager.lists.remove(atOffsets: offsets)
    }
}
