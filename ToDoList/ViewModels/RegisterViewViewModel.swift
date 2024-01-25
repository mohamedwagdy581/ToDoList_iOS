//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject
{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(name: String = "", email: String = "", password: String = "", errorMessage: String = "") {
        self.name = name
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
    }
    
    
// Register Function
    func register()
    {
        // Validate
        guard validate() else
        {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else
            {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    // Insert and create user to firebase
    private func insertUserRecord(id: String)
    {
        let newUser = UserModel(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        // Start create data base on firebase
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
// Validate Function
    private func validate() -> Bool
    {
        errorMessage = ""
        // Validate that name $ email and password is not empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else
        {
            return false
        }
        
        // Validate that email is contain @ and .
        guard email.contains("@"), email.contains(".") else
        {
            return false
        }
        
        // Validate that the password is more than 6 characters
        guard password.count >= 6 else{
            return false
        }
        
        
        return true
    }
    
    
}
