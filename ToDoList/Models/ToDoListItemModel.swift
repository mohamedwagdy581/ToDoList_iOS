//
//  ToDoListItemModel.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable
{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool)
    {
        isDone = state
    }
    
    
    
}
