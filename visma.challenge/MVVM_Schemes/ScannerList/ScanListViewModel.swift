//
//  ScanViewModel.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 22/03/2025.
//

import Foundation


import SwiftUI
import Vision
import VisionKit
import CoreData

class ScanListViewModel: ObservableObject {
    
    @StateObject var storageHelper = StorageHelper()
    
    
    init(){
        
    }
    
    
    func processScan(_ images: [UIImage]) {
        guard let image = images.first else { return }
        
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
                print("Text recognition failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let extractedText = observations
                .compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: "\n")
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                //self.scannedText = extractedText
                if let fileName = PhotoStorageManager.shared.saveImage(image) {
                    self.storageHelper.savePhoto(fileName:fileName, extractedText)
                    //print("extractedText == \(fileName)")
                    //print("extractedText == \(extractedText)")
                }
            }
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        guard let cgImage = image.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("Failed to perform OCR: \(error.localizedDescription)")
            }
        }
    }
}
