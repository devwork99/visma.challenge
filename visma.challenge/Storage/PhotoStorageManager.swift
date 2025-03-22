//
//  PhotoStorageManager.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import SwiftUI

class PhotoStorageManager {
    static let shared = PhotoStorageManager()
    
    private init() {}

    func saveImage(_ image: UIImage) -> String? {
        let fileManager = FileManager.default
        let directory = getDocumentsDirectory()
        let uniqueFileName = "\(UUID().uuidString).jpg"
        let fileURL = directory.appendingPathComponent(uniqueFileName)

        if let data = image.jpegData(compressionQuality: 0.8) {
            do {
                try data.write(to: fileURL)
                return uniqueFileName
            } catch {
                print("Error saving image: \(error)")
            }
        }
        return nil
    }

    func loadImage(named fileName: String) -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        }
        return nil
    }

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
