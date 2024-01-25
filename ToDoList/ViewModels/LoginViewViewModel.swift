//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    // Login Function
    func login() 
    {
        // Validate
        guard validate() else {
            return
        }
        
        // Try to login with firebase
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    // Validate Function
    private func validate() -> Bool
    {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            errorMessage = "Pelase fill in all fields."
            return false
        }
        
        // Email Valid
        guard email.contains("@"), email.contains(".") else
        {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
