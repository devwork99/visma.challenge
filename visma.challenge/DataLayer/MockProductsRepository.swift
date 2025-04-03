//
//  MockProductsRepository.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 28/03/2025.
//

import Foundation
import CoreData

class MockProductRepository: ProductsRepositoryProtocol {
    
    
    var container : NSPersistentContainer
    
    init(container:NSPersistentContainer){
        self.container = container
    }
    
    func saveProduct(fileName: String, _ text: String) {
        
        let context = container.viewContext
        let item = PhotoEntity(context:context)
        
        item.fileName = fileName
        item.id = UUID()
        item.text_ext = text
        item.currency = "Euro"
        
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let dateStr = formatter.string(from: today)

        
        item.date = dateStr
        
        do {
            try context.save()
        } catch let error {
            print("Effor save - \(error.localizedDescription)")
        }
    }
    
    
    func fetchProducts() -> [PhotoEntity] {
        
        let fetchReq : NSFetchRequest<PhotoEntity> = PhotoEntity.fetchRequest()
        var entities = [PhotoEntity]()
        do {
            entities = try self.container.viewContext.fetch(fetchReq)
        } catch let error {
            print("error - \(error.localizedDescription)")
            entities = []
        }
        
        return entities
    }
}
