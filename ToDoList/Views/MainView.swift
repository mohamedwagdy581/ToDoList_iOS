//
//  ContentView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty
        {
            accountView
        }else
        {
            LoginView()
        }
    }
    
    
    @ViewBuilder
    var accountView: some View{
        // Signed In
        TabView
        {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem
            {
                Label("Home", systemImage: "house")
            }
            
            ProfileView()
                .tabItem
            {
                Label("Profile", systemImage: "person.circle")
            }

        }
    }
}

#Preview {
    MainView()
}
