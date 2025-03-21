//
//  AppCoordinator.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation



class AppCoordinator: Coordinator {
    
    @Published var navigationPath: [String] = []

    func start() {
     
    }
    
    func goToDetail() {
        
        navigationPath.append(NavigationKeywords.detailView.rawValue)
    }
    
    func goBack() {
        navigationPath.removeLast()
    }
}


enum NavigationKeywords : String {
    case detailView = "DetailView"
}
