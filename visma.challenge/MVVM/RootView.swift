//
//  ContentView.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 20/03/2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var vm = RootViewModel()
    
    
    var body: some View {
        
        VStack {
            
            HStack(alignment:.center, spacing:10){
                
                Text("Add Expense")
                    .foregroundColor(.gray)
                    .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                    .frame(height:100)
                    .lineLimit(1)
                
                    
                Image(systemName: "plus.app.fill")
                    .imageScale(.large)
                    .foregroundColor(.cyan)
                    .frame(width:100, height:60)
                    .border(.gray)
                
            }
            
            
            List {
                ForEach(vm.items, id:\.self){ item in
                    
                    HStack{
                        Text(item)
                            .foregroundColor(.gray)
                            .font(Font(UIFont.systemFont(ofSize:10)))
                            .frame(maxWidth:.infinity, alignment:.leading)
                        
                        
                        Image(systemName:"plus.viewfinder")
                            .frame(width: 40, height: 40)
                            .frame(maxWidth:.infinity, alignment:.trailing)
                    }
                }
            }
            
            
            
            //Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
