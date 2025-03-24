//
//  ContentView.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 20/03/2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var vm = RootViewModel()
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var photoViewModel = StorageHelper()
    
    
    var body: some View {
        
        NavigationStack(path: $coordinator.navigationPath) {
            
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
                            coordinator.goToDetail()
                        }
                }
            }

            .navigationDestination(for: Screens.self) { value in
                switch value {
                case .scanFeatureView:
                    ScansListView()
                case .scanDetailView:
                    ScanDetailView()
                case .goHome:
                    RootView()
                }
            }

        }
        
        .environmentObject(coordinator)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
