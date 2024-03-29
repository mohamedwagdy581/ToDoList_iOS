//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
