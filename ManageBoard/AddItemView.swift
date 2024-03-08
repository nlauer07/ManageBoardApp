//
//  AddItemView.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var toDoList: ToDoList
    @State private var itemName = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $itemName)
            }
            .navigationBarTitle("Add New Item", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    let newItem = ToDoItem(name: itemName, isCompleted: false)
                    toDoList.items.append(newItem)
                    dismiss()
                }
            )
        }
    }
}

