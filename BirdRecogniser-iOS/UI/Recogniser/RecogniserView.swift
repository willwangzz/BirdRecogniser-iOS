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
    
    @State private var image: UIImage? {
        didSet {
            if oldValue != image {
                imageDidSet = true
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(isActive: $imageDidSet) {
                    if let birdImage = image {
                        PhotoDetailView(image: birdImage)
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
                    if let birdImage = image {
                        PhotoDetailView(image: birdImage)
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
}



struct RecogniserView_Previews: PreviewProvider {
    static var previews: some View {
        RecogniserView()
    }
}
