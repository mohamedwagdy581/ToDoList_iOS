//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import FirebaseFirestore
import Foundation


/// ViewModel for list of items view
/// Primary tap
class ToDoListViewViewModel: ObservableObject
{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String)
    {
        self.userId = userId
    }
    
    /// Delete ToDo list item
    /// - Parameter id: item id to delete
    func delete(id: String)
    {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
