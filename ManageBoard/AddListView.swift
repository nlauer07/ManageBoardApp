//
//  AddListView.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import SwiftUI

struct AddListView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var manager: ToDoListManager
    @State private var listName = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("List Name", text: $listName)
            }
            .navigationBarTitle("Add New List", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    saveList()
                    isPresented = false
                }
            )
        }
    }
    
    private func saveList() {
        let newList = ToDoList(name: listName)
        manager.addList(newList)
    }
}
