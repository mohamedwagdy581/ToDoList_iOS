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
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
