//
//  User.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import Foundation

struct UserModel: Codable
{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
