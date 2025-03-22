//
//  PhotoViewModel.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import CoreData

class StorageHelper: ObservableObject {
    
    @Published var scans: [PhotoEntity] = []
    
    private let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "visma")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error)")
            }
        }
        fetchPhotos()
    }

    func savePhoto(fileName: String, _ text:String) {
        let context = container.viewContext
        let newPhoto = PhotoEntity(context: context)
        newPhoto.id = UUID()
        newPhoto.fileName = fileName
        newPhoto.text_ext = text
        newPhoto.date = Date()
        
        do {
            try context.save()
            fetchPhotos()
        } catch {
            print("Failed to save photo: \(error)")
        }
    }

    func fetchPhotos() {
        let request: NSFetchRequest<PhotoEntity> = PhotoEntity.fetchRequest()
        do {
            scans = try container.viewContext.fetch(request)
        } catch {
            print("Failed to fetch photos: \(error)")
        }
    }
}
