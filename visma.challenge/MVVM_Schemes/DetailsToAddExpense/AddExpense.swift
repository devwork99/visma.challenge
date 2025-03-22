//
//  AddExpense.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import SwiftUI


struct AddExpense : View {
    
    @ObservedObject var coordinator : AppCoordinator
    
    @StateObject private var photoViewModel = PhotoViewModel()
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    
    
    var body : some View {
        
        VStack(spacing:20){
            
            List {
                ForEach(photoViewModel.photos, id: \.id) { photo in
                    if let image = PhotoStorageManager.shared.loadImage(named: photo.fileName ?? "") {
                        
                        ReceiptCell(imageIn:image, imageName:photo.fileName ,imageDate:"21-03-2025", totalAmount:23.5, currency:"Euro")
                        
                    } else {
                        Text("Image not found")
                    }
                }
            }
            
            Button {
                showCamera = true
            } label:{
                Text("Open Camera")
                    .font(Font(UIFont.boldSystemFont(ofSize: 14)))
                    .frame(width:200 ,height:40)
                    .cornerRadius(5.0)
                    .background(.white)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                    .shadow(radius:5)
                    
                    
            }
            
            
            Button {
                coordinator.goBack()
            } label: {
                Text("Dismiss".uppercased())
                    .font(Font(UIFont.boldSystemFont(ofSize: 14)))
                    .frame(width:200 ,height:40)
                    .foregroundColor(.white)
                    .background(.gray)
                    
                    .cornerRadius(5)
                    
                    
                    //.padding()
            }
            
            
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $selectedImage) { image in
                if let fileName = PhotoStorageManager.shared.saveImage(image) {
                    photoViewModel.savePhoto(fileName: fileName)
                }
            }
        }
        .navigationTitle("Photo List")
        
    }
    
}



struct ReceiptCell : View {
    
    var imageIn : UIImage
    var imageName : String?
    var imageDate : String
    var totalAmount : Double
    var currency : String
    
    var body : some View {
        HStack{
            Image(uiImage: imageIn)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Spacer()
            
            VStack(alignment:.leading){
                Text(imageName ?? "")
                    .lineLimit(2)
                Text(imageDate)
                Text("\(totalAmount)")
                Text(currency)
            }
        }
    }
}


struct AddExpense_Preview : PreviewProvider {
    static var previews : some View {
        AddExpense(coordinator: AppCoordinator())
    }
}
