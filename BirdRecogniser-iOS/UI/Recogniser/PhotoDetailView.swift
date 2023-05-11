//
//  PhotoDetailView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 23/04/23.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var image: UIImage?

    @State var birdRecognitionResults: [BirdRecognisitionResult]?
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center) {
                VStack {
                    if let _ = image {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width, height: geo.size.width * (image?.size.height ?? 1) / (image?.size.width ?? 1))
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    NavigationLink {
                        RecogniseResultsView(image: self.$image)
                    } label: {
                        Text("Recognise")
                            .font(Theme.miniHeaderFont.toFont())
                            .foregroundColor(.white)
                            .padding(.horizontal, 40.0)
                            .frame(height: 40)
                            .background(Theme.mainColor?.toColor())
                            .cornerRadius(20)
                    }
                }
            }
            .frame(height: geo.size.height)
        }
        .addMainGradientBackground()
        .navigationTitle("Photo Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.image = nil
        }, label: {
            Image("navigation-back")
        }))
    }
    
    
}

struct PhotoDetailView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "EMU0.jpg")
    
    static var previews: some View {
        PhotoDetailView(image: $image)
    }
}
