//
//  TakeImagesView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 8/04/23.
//

import SwiftUI

struct TakeImagesView: View {
    
    @State private var showCameraPicker = false
    @State private var showPhotoPicker = false
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
            Button {
                showCameraPicker = true
            } label: {
                Text("Camera")
            }
            
            Button {
                showPhotoPicker = true
            } label: {
                Text("Photo Library")
            }
            
            Divider()
            
            Text("Text added by Bowen")
                .bold()
                .foregroundColor(.green)
            
            Button {
                let vet = (name: "aaa", xvalue: 1)
                print("\(vet.1)")
            } label: {
                Text("Click Me")
            }
            
            Image(uiImage: ((image != nil) ? image!.resize(to: .init(width: 224, height: 224))!:UIImage()))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .fullScreenCover(isPresented: $showCameraPicker) {
            ImagePicker(sourceType: .camera, image: self.$image)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $showPhotoPicker) {
            ImagePicker(sourceType: .photoLibrary, image: self.$image)
                .ignoresSafeArea()
        }
    }
}

struct TakeImagesView_Previews: PreviewProvider {
    static var previews: some View {
        TakeImagesView()
    }
}
