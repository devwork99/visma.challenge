//
//  ScanDetailView.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 23/03/2025.
//

import Foundation
import SwiftUI


struct ScanDetailView : View {
    
    
    @StateObject private var vm = ScanDetailViewModel(entity:StorageHelper().scans.first ?? PhotoEntity())
    
    //@ObservedObject var coordinator : AppCoordinator
    @EnvironmentObject var coordinator: AppCoordinator
    
    
    var body: some View {
            
        ScrollView{
            VStack{
                
                Image(uiImage: vm.imgToLoad)
                    .resizable()
                    .scaledToFit()
                    .frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height*0.40)
                
                
                
                Text(vm.extText)
                    .font(Font(UIFont.systemFont(ofSize:10)))
                    .foregroundColor(.gray)
                
                
                Button {
                    coordinator.goHome()
                } label: {
                    Text("Home Screen".uppercased())
                        .font(Font(UIFont.boldSystemFont(ofSize: 14)))
                        .frame(width:200 ,height:40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(5)
                }
            }
        }
        .navigationTitle("Scan Details")
        
    }
}



struct ScanDetailView_Previews : PreviewProvider{
    static var previews: some View {
        ScanDetailView()
    }
}
