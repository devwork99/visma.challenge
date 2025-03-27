//
//  ContentView.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 20/03/2025.
//

import SwiftUI

struct ContentView : View {
    
    @StateObject var coordinator = AppCoordinator()
    
    var body : some View {
        
        NavigationStack(path: $coordinator.navigationPath) {
            RootView(coordinator:coordinator)

            
                .navigationDestination(for: Screens.self) { value in
                    coordinator.getDestination(for: value)
                }
        }
        
    }
}


struct RootView: View {
    
    @StateObject private var vm = RootViewModel()
    
    var coordinator : AppCoordinator
    
    var body: some View {
        
        VStack {
            
            HStack(alignment:.center, spacing:10){
                
                Button {
                    coordinator.goToScanFeature()
                    
                } label: {
                    Text("Scans Feature")
                        .foregroundColor(.gray)
                        .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                        .frame(height:100)
                        .lineLimit(1)
                }
                
                Image(systemName: "plus.app.fill")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                    .frame(width:100, height:60)
                    .border(.gray)
                    .onTapGesture {
                        coordinator.goToScanFeature()
                    }
            }
        }
        
    }
}


