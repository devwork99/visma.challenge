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
        
    private let scanListViewModel: ScanListViewModel
    
    init() {
        let repository = ProductsRepositoryService()
        let useCase = ProductUseCaseService(productsRepositoryService:repository)
        self.scanListViewModel = ScanListViewModel(productsUseCase:useCase)
    }
    
    func start() { }
    
    func goToScanFeature(){
        navigationPath.append(Screens.scanFeatureView)
    }
    
    func goToDetail(product:PhotoEntity) {
        navigationPath.append(product)
    }
    
    func goBack() {
        navigationPath.removeLast()
    }
    
    func goHome(){
        navigationPath = NavigationPath()
    }
    
    func getDestination(for value: AnyHashable) -> some View {
        if  value as? Screens == Screens.scanFeatureView {
            return AnyView(ScansListView(coordinator:self, vm:scanListViewModel))
        } else if let product = value as? PhotoEntity {
            return AnyView(ScanDetailView(vm:ScanDetailViewModel(entity:product), coordinator: self))
        }
        return AnyView(EmptyView())
    }
    
}


enum Screens : Hashable {
    case scanFeatureView
    //case scanDetailView
    case PhotoEntity
    case goHome
}


