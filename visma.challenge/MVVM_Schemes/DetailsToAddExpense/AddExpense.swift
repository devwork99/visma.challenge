//
//  AddExpense.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import SwiftUI




struct AddExpense : View {
    
    @ObservedObject var coordinator : AppCoordinator
    
    
    var body : some View {
     
        VStack{
            
            Text("Expense added")
            
            Button {
                coordinator.goBack()
            } label: {
                Text("Go Back")
                    .foregroundColor(.gray)
                    .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                    .frame(height:100)
                    .lineLimit(1)
            }

            
        }
        
    }
    
}

