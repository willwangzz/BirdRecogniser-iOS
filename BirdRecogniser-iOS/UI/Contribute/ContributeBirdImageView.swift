//
//  ContributeBirdImageView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 13/05/23.
//

import SwiftUI

struct ContributeBirdImageView: View {
    
    @State private var showSelectPhoto = false
    
    @Binding var image: UIImage?
    
    @State var originalImage: UIImage?
    
    var body: some View {
        if let _ = image {
            ContributeBirdAddedView(image: $image)
                .frame(width: 88, height: 88)
        } else {
            Button {
                showSelectPhoto = true
            } label: {
                ContributeAddBirdView()
            }
            .sheet(isPresented: $showSelectPhoto) {
                ContributeSelectPhotoView(image: self.$originalImage, showSelectPhoto: $showSelectPhoto)
            }
            .onChange(of: originalImage) { newValue in
                if let resizedImage = newValue?.resize(to: .init(width: 224, height: 224)) {
                    self.image = resizedImage
                }
            }
        }
    }
}

private struct ContributeAddBirdView: View {
    
    var body: some View {
        Image("contribute-add")
            .frame(width: 88, height: 88)
            .background(UIColor(hex: "#D9D9D9")?.toColor())
            .cornerRadius(30)
    }
}

private struct ContributeBirdAddedView: View {
    
    @Binding var image: UIImage?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if let birdImage = image {
                Image(uiImage: birdImage)
                    .resizable()
                    .background(UIColor(hex: "#D9D9D9")?.toColor())
                    .cornerRadius(30)
            }
            
            Button {
                image = nil
            } label: {
                Image("contribute-delete")
            }
            .offset(x: 10, y: -10)

        }
        .frame(width: 88, height: 88)
        
    }
}

struct ContributeBirdImageView_Previews: PreviewProvider {
    
    @State static var image: UIImage? = nil //UIImage(named: "EMU3.jpg")
    
    @State static var image1: UIImage? = UIImage(named: "EMU3.jpg")
    
    static var previews: some View {
        
        ContributeAddBirdView()
        
        ContributeBirdAddedView(image: $image1)
        
        ContributeBirdImageView(image: $image)
        
        ContributeBirdImageView(image: $image1)
    }
}
