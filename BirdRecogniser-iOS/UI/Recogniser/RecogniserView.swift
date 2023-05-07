//
//  RecogniserView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 15/04/23.
//

import SwiftUI

struct RecogniserView: View {
    
    @State private var showCameraPicker = false
    @State private var showPhotoPicker = false
    
    @State private var imageDidSet = false
    
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(isActive: $imageDidSet) {
                    if image != nil {
                        PhotoDetailView(image: self.$image)
                    }
                } label: {
                    Button {
                        showPhotoPicker = true
                    } label: {
                        RecogniserButton(title: "From Library",
                                         subtitle: "Select your photos from your library",
                                         note: "Select your photo",
                                         backgroundImageName: "recogniser-select-photo-background")
                        .frame(height: 200)
                    }
                }
                
                Spacer()
                
                NavigationLink(isActive: $imageDidSet) {
                    if image != nil {
                        PhotoDetailView(image: self.$image)
                    }
                } label: {
                    Button(action: {
                        showCameraPicker = true
                    }, label: {
                        RecogniserButton(title: "Take a photo",
                                         subtitle: "Take a photo to recognise",
                                         note: "Take a photo",
                                         backgroundImageName: "recogniser-take-photo-background")
                        .frame(height: 200)
                    })
                }
                
                Spacer()
            }
            .padding(30)
            .navigationTitle("Bird Recognition")
            .navigationBarTitleDisplayMode(.inline)
            .addMainGradientBackground()
            .fullScreenCover(isPresented: $showCameraPicker) {
                ImagePicker(sourceType: .camera, image: self.$image)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $showPhotoPicker) {
                ImagePicker(sourceType: .photoLibrary, image: self.$image)
                    .ignoresSafeArea()
            }
            .onChange(of: image) { newValue in
                imageDidSet = newValue != nil
            }
            
        }
    }
}



struct RecogniserView_Previews: PreviewProvider {
    static var previews: some View {
        RecogniserView()
    }
}
