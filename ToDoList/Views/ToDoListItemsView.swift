//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel =  ToDoListItemViewViewModel()
    @StateObject var profileModel =  ProfileViewViewModel()
    let item: ToDoListItemModel
    var body: some View {
        HStack
        {
            VStack(alignment: .leading)
            {
                // Title Text
                Text(item.title)
                    .font(.body)
                
                // Date
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            // Check Button
            Button
            {
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemsView(item: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
