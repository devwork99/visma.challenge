//
//  ProductUseCaseTests.swift
//  visma.challengeTests
//
//  Created by Muhammad Yasir on 01/04/2025.
//


import XCTest
import CoreData
@testable import visma_challenge

final class ProductUseCaseTests: XCTestCase {
    
    var container : NSPersistentContainer!
    var useCase: ProductUseCaseService!
    var mockRepository: MockProductRepository!
    
    override func setUp() {
        super.setUp()
        container = NSPersistentContainer(name: AppConstants.coreDataModelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Container == \(error.localizedDescription)")
            }
        }
        mockRepository = MockProductRepository(container:self.container)
        useCase = ProductUseCaseService(productsRepositoryService:mockRepository)
    }
    
    func testAddProduct() {
        useCase.addProduct(fName:"abc123def456", text:AppConstants.randomExtractedText)
        XCTAssertEqual(mockRepository.fetchProducts().count, 1)
        let filtered = mockRepository.fetchProducts().filter { item in
            item.fileName == "abc123def456"
        }
        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first!.fileName, "abc123def456")
    }
    
    func testFetchProducts() {
        let products = useCase.fetchProducts()
        print("Products == \(products)")
        XCTAssertEqual(products.count > 0, true)
    }
    
    

}

