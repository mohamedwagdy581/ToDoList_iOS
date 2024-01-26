//
//  ProfileView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                if let user = viewModel.user
                {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear
        {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder 
    func profile(user: UserModel) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info: Name, Email and Member Since
        VStack(alignment: .leading){
            // Name Row
            HStack
            {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            // Email Row
            HStack
            {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            // Member Since
            HStack
            {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign Out
        Button("Log Out")
                    {
            viewModel.logOut()
        }
                    .tint(.red)
                    .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
