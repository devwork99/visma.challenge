//
//  AppCoordinator.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import SwiftUI


class AppCoordinator:  ObservableObject {
    
    @Published var navigationPath = NavigationPath()
        
    func start() { }
    
    func goToScanFeature(){
        navigationPath.append(Screens.scanFeatureView)
    }
    
    func goToDetail() {
        navigationPath.append(Screens.scanDetailView)
    }
    
    func goBack() {
        navigationPath.removeLast()
    }
    
    func goHome(){
        navigationPath = NavigationPath()
    }
}


enum Screens : Hashable {
    case scanFeatureView
    case scanDetailView
    case goHome
}
