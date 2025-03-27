//
//  PhotoViewModel.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import CoreData


protocol ProductsRepositoryProtocol {
    func saveProduct(fileName: String, _ text:String)
    func fetchProducts() -> [PhotoEntity]
}


class ProductsRepositoryService: ProductsRepositoryProtocol {
    
    private let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "visma")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error)")
            }
        }
    }

    func saveProduct(fileName: String, _ text:String) {
        let context = container.viewContext
        let newPhoto = PhotoEntity(context: context)
        newPhoto.id = UUID()
        newPhoto.fileName = fileName
        newPhoto.text_ext = text
        
        let topics = Helper.extractReceiptDetails(from:text)
        
        newPhoto.date = topics.date ?? ""
        newPhoto.total_amount = topics.total ?? ""
        newPhoto.currency = topics.currency
        
        do {
            try context.save()
        } catch {
            print("Failed to save photo: \(error)")
        }
    }

    func fetchProducts() -> [PhotoEntity] {
        let request: NSFetchRequest<PhotoEntity> = PhotoEntity.fetchRequest()
        do {
            let entities = try container.viewContext.fetch(request)
            return entities
        } catch {
            print("Failed to fetch photos: \(error)")
            return []
        }
    }
}
