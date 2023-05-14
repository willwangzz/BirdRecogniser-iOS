//
//  ContributeSelectPhotoView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 14/05/23.
//

import SwiftUI


struct ContributeSelectPhotoView: View {
    
    @State private var showCameraPicker = false
    @State private var showPhotoPicker = false
    
    @Binding var image: UIImage?
    
    @Binding var showSelectPhoto: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button {
                    showPhotoPicker = true
                } label: {
                    RecogniserButton(title: "From Library",
                                     subtitle: "Select your photos from your library",
                                     note: "Select your photo",
                                     backgroundImageName: "recogniser-select-photo-background")
                    .frame(height: 200)
                }
                
                Spacer()
                
                Button(action: {
                    showCameraPicker = true
                }, label: {
                    RecogniserButton(title: "Take a photo",
                                     subtitle: "Take a photo of new bird",
                                     note: "Take a photo",
                                     backgroundImageName: "recogniser-take-photo-background")
                    .frame(height: 200)
                })
                
                Spacer()
            }
            .padding(30)
            .navigationTitle("Select Photo")
            .navigationBarTitleDisplayMode(.inline)
            .addMainGradientBackground()
            .navigationBarItems(leading: Button(action: {
                showSelectPhoto = false
            }, label: {
                Text("Cancel")
            }))
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
}

struct ContributeSelectPhotoView_Previews: PreviewProvider {
    @State static var image: UIImage? = nil
    @State static var showSelectPhoto: Bool = false
    
    static var previews: some View {
        ContributeSelectPhotoView(image: $image, showSelectPhoto: $showSelectPhoto)
    }
}
