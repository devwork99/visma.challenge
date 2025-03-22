//
//  ContentView.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 20/03/2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var vm = RootViewModel()
    @StateObject var coordinator = AppCoordinator()
    @StateObject private var photoViewModel = StorageHelper()
    
    var body: some View {
        
        NavigationStack(path: $coordinator.navigationPath) {
            
            VStack {
                
                HStack(alignment:.center, spacing:10){

                    Button {
                        coordinator.goToDetail()

                    } label: {
                        Text("Add Expense")
                            .foregroundColor(.gray)
                            .font(Font(UIFont.boldSystemFont(ofSize: 20)))
                            .frame(height:100)
                            .lineLimit(1)
                    }
                    
                    Image(systemName: "plus.app.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                        .frame(width:100, height:60)
                        .border(.gray)
                        .onTapGesture {
                            coordinator.goToDetail()
                        }
                    
                }
                
                List {
                    ForEach(photoViewModel.scans, id: \.id) { photo in
                        if let image = PhotoStorageManager.shared.loadImage(named: photo.fileName ?? "") {
                            
                            ReceiptCell(imageIn:image, imageName:photo.fileName ,imageDate:photo.date?.description ?? "", totalAmount:23.5, currency:"Euro", textExt:photo.text_ext ?? " ")
                            
                        } else {
                            Text("Image not found")
                        }
                    }
                }
            }
            
            .navigationDestination(for: String.self) { value in
                
                if value == NavigationKeywords.detailView.rawValue {
                    AddExpense(coordinator: coordinator)
                }
                
            }
        }
        

        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
