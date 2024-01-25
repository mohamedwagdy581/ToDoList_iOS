//
//  RegisterView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack
        {
            // Header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angel: -15, background: .orange)
            
            // Form
            Form
            {
                // Name Text Field
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                // Name Text Field
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                // Name Text Field
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Register Button
                TLButton(title: "Create Account", background: .green)
                {
                    // Attempt Register
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            
            
            // Spacer
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
