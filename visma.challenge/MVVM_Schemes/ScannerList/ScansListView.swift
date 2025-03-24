//
//  AddExpense.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
import SwiftUI


struct ScansListView : View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var vm = ScanListViewModel()
    

    private var storageHelper = StorageHelper()
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    
    
    var body : some View {
        
        VStack(spacing:20){
            
            List {
                ForEach(vm.storageHelper.scans, id: \.id) { photo in
                    if let image = PhotoStorageManager.shared.loadImage(named: photo.fileName ?? "") {
                                                
                        Button {
                            coordinator.goToDetail()
                        } label: {
                            ReceiptCell(imageIn:image,
                                        imageName:photo.fileName,
                                        textExt:photo.text_ext ?? "",
                                        imageDate:photo.date ?? "",
                                        totalAmount:photo.total_amount ?? "",
                                        currency:photo.currency ?? ""
                                        )
                                                        
                            //print("photo.fileName == \(String(describing: photo.fileName))")
                            //print("photo.text_ext == \(photo.text_ext ?? "")")
                        }

                    } else {
                        Text("Image not found")
                    }
                }
            }
            
            
            Button {
                showCamera = true
            } label:{
                Text("Add Scan")
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
            }
        }
        .sheet(isPresented: $showCamera) {
            CameraView { images in
                vm.processScan(images)
            }
        }
        
        .navigationTitle("Scans List")
        
    }
    
}



struct ReceiptCell : View {
    
    var imageIn : UIImage
    var imageName : String?
    
    var textExt : String
    var imageDate : String
    var totalAmount : String
    var currency : String
    
    
    var body : some View {
        HStack(spacing:10){
            
            Image(uiImage: imageIn)
                .resizable()
                .scaledToFit()
                .frame(width:80,height: 80)
            
            VStack(alignment:.leading, spacing:4.0){
                HStack{
                    Text("Date:")
                        .font(Font(UIFont.systemFont(ofSize:10)))
                        .foregroundColor(.green)
                    Spacer()
                    Text(imageDate)
                        .font(Font(UIFont.boldSystemFont(ofSize:10)))
                        .foregroundColor(.blue)
                }
                
                HStack{
                    Text("Total:")
                        .font(Font(UIFont.systemFont(ofSize:10)))
                        .foregroundColor(.green)
                    Spacer()
                    Text(totalAmount)
                        .font(Font(UIFont.boldSystemFont(ofSize:10)))
                        .foregroundColor(.blue)
                }
                HStack{
                    Text("Currency:")
                        .font(Font(UIFont.systemFont(ofSize:10)))
                        .foregroundColor(.green)
                    Spacer()
                    Text(currency)
                        .font(Font(UIFont.boldSystemFont(ofSize:10)))
                        .foregroundColor(.blue)
                }
                
                Text(imageName ?? "")
                    .lineLimit(3)
                    .font(Font(UIFont.systemFont(ofSize:5)))
            }
            .frame(maxWidth:100.0)
            
            
            ScrollView{
                Text(textExt)
                    .font(Font(UIFont.boldSystemFont(ofSize:10)))
                    .foregroundColor(.white)
                    .background(.gray)
            }.frame(height:150)
        }
    }
}


struct AddExpense_Preview : PreviewProvider {
    static var previews : some View {
        ScansListView()
    }
}
