//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    
    init(userId: String)
    {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                List(items)
                { item in
                    ToDoListItemsView(item: item)
                        .swipeActions
                    {
                        Button("Delete")
                        {
                            // Delete Action
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar
            {
                Button
                {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "jSktLTlflagC77hF9JLNiJNmkEG3")
}
