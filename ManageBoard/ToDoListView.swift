//
//  ToDoListView.swift
//  ManageBoard
//
//  Created by Nick Lauer on 3/8/24.
//

import SwiftUI

struct ToDoListView: View {
    @Binding var toDoList: ToDoList
    @State private var showingAddItemView = false // For showing the add item view

    var body: some View {
        List {
            ForEach($toDoList.items) { $item in
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(item.isCompleted ? .green : .gray)
                    Text(item.name)
                        .strikethrough(item.isCompleted, color: .gray)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        item.isCompleted.toggle()
                        triggerHapticFeedback()
                    } label: {
                        Label(item.isCompleted ? "Undo" : "Complete", systemImage: item.isCompleted ? "arrow.uturn.backward" : "checkmark")
                    }
                    .tint(item.isCompleted ? .blue : .green)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle(toDoList.name)
        .toolbar {
            Button("Add Item") {
                showingAddItemView = true
            }
        }
        .sheet(isPresented: $showingAddItemView) {
            AddItemView(toDoList: $toDoList)
        }
    }

    func deleteItems(at offsets: IndexSet) {
        toDoList.items.remove(atOffsets: offsets)
    }

    private func triggerHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
