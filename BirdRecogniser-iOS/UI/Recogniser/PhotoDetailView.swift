//
//  PhotoDetailView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 23/04/23.
//

import SwiftUI

struct PhotoDetailView: View {
    
    var image: UIImage
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                HStack(alignment: .center) {
                    VStack {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: geo.size.width, height: geo.size.width)
                        Rectangle()
                            .fill(.clear)
                            .frame(height: 30)
                        Button("Recognise") {
                            
                        }
                        .font(Theme.miniHeaderFont.toFont())
                        .foregroundColor(.white)
                        .padding(.horizontal, 40.0)
                        .frame(height: 40)
                        .background(Theme.mainColor?.toColor())
                        .cornerRadius(20)
                    }
                }
                .frame(height: geo.size.height)
            }
            .navigationTitle("Photo Detail")
            .navigationBarTitleDisplayMode(.inline)
            .addMainGradientBackground()
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(image: UIImage(named: "EMU0.jpg")!)
    }
}
