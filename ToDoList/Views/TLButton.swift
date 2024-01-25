//
//  TLButton.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 25/01/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button
        {
            // Attempt Log in
            action()
        }
        label: {
        
            ZStack
            {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
            // Login Text
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(
title: "Title", 
background: .blue,
action: 
    {
        // Actrion
    })
}
