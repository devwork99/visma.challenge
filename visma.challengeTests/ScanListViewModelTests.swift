//
//  ScanListViewModelTests.swift
//  visma.challengeTests
//
//  Created by Muhammad Yasir on 01/04/2025.
//

import UIKit
import XCTest
import CoreData
import Testing
@testable import visma_challenge

class ScanListViewModelTests : XCTestCase {

    var scanListViewModel : ScanListViewModel!
    var productUseCase : ProductUseCaseService!
    var productRepository : MockProductRepository!
    
    var container : NSPersistentContainer!
    
    override func setUp(){
        container = NSPersistentContainer(name:AppConstants.coreDataModelName)
        container.loadPersistentStores { _, error in
            if let err = error {
                print("Error == \(err.localizedDescription)")
            }
        }
        productRepository = MockProductRepository(container:self.container)
        productUseCase = ProductUseCaseService(productsRepositoryService:productRepository)
        scanListViewModel = ScanListViewModel(productsUseCase:productUseCase)
    }
    
    func testAddProduct(){
        if let data = FileManager.default.contents(atPath: "/visma.challenge/Demo/Input/IMG_1187.JPEG"){
            let img = UIImage(data:data) ?? UIImage(named:"IMG_1187")!
            scanListViewModel.processScan([img])
        }
    }
    
    func testFetchProducts(){
        //first run the test to add a Scan "testAddProduct()"
        scanListViewModel.loadScans()
        print("count == \(scanListViewModel.products.count)")
        XCTAssertEqual(scanListViewModel.products.count > 0, true)
    }
    
    
    

}
