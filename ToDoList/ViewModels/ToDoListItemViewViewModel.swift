//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single todo list item view (each row in items lsit)
class ToDoListItemViewViewModel: ObservableObject
{
    init(){}
    
    func toggleIsDone(item: ToDoListItemModel)
    {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db  = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newItem.id).setData(newItem.asDictionary())
    }
}
