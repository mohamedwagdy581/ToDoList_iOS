//
//  HeaderView.swift
//  ToDoList
//
//  Created by Mohamed Wagdy on 24/01/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angel: Double
    let background: Color
    
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background).rotationEffect(Angle(degrees: angel))
                
            // Column of todo list and get things done text
            VStack
            {
                // First elemnt in column
                // Todo list text with bold and white and 50 font size
                Text(title).foregroundColor(.white).font(.system(size: 50)).bold()
                
                // Second elemnt in column
                Text(subTitle).foregroundColor(.white).font(.system(size: 30))
            }.padding(.top, 80)
            
            
        }.frame(width: UIScreen.main.bounds.width * 3,
            height: 350)
            .offset(y: -150)
        
    }
}

#Preview {
    HeaderView(title: "title", subTitle: "subTitle", angel: 15, background: .blue
    )
}
