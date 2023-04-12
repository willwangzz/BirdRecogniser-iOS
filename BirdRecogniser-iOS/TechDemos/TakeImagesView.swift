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
    
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
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
            
            Text("First text added by Bowen.")

            Button {
            } label: {
                Text("Click Me")
            }
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .fullScreenCover(isPresented: $showCameraPicker) {
            ImagePicker(sourceType: .camera) { image in
                self.image = image
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showPhotoPicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                self.image = image
            }
            .ignoresSafeArea()
        }
    }
}

struct TakeImagesView_Previews: PreviewProvider {
    static var previews: some View {
        TakeImagesView()
    }
}
