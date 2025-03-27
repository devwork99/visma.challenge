//
//  ScanDetailViewModel.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 23/03/2025.
//

import Foundation
import UIKit

class ScanDetailViewModel : ObservableObject {
    
    
    @Published var obj : PhotoEntity
    
    var imgToLoad = UIImage()
    var extText = ""
    
    init(entity: PhotoEntity){
        obj = entity
        
        self.imgToLoad = FileStorageManager.shared.loadImage(named:obj.fileName ?? "") ?? UIImage(named:"533258FA-2F40-49A1-8E42-A8913912DE75.jpg")!
        self.extText = obj.text_ext ?? ""
    }
    
    
}
