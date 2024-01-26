//
//  LoginView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angel: 15, background: .pink)
                
                
                // Login Form
                Form
                {
                    // Validate of Form that email and password not empty and show to user
                    if !viewModel.errorMessage.isEmpty
                    {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    // Email Text Field
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    // Password Text Field
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Login Button
                    TLButton(title: "Log In", background: .blue)
                    {
                        // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
                // Create Account
                VStack
                {
                    Text("New around here?")
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
                
                
            }.padding()

        }
    }
}

#Preview {
    LoginView()
}
