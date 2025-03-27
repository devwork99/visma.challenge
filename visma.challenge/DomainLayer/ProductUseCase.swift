//
//  ProductUseCase.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 26/03/2025.
//

import Foundation


protocol ProductUseCaseProtocol {
    func addProduct(fName:String, text:String)
    func fetchProducts() -> [PhotoEntity]
}


class ProductUseCaseService : ProductUseCaseProtocol{
    
    private let productsRepositoryService: ProductsRepositoryProtocol
    
    init(productsRepositoryService: ProductsRepositoryProtocol) {
        self.productsRepositoryService = productsRepositoryService
    }
    
    func addProduct(fName:String, text:String) {
        productsRepositoryService.saveProduct(fileName:fName, text)
    }
    
    func fetchProducts() -> [PhotoEntity] {
        return productsRepositoryService.fetchProducts()
    }
    
    
}
