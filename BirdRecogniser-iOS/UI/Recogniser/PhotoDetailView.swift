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
    
    @State var isShowResult: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center) {
                VStack {
                    if let _ = image {
                        Image(uiImage: image!)
                            .resizable()
                            .frame(width: geo.size.width, height: geo.size.width)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    NavigationLink(isActive: self.$isShowResult) {
                        RecogniseResultDetailView(image: self.$image)
                    } label: {
                            Button("Recognise") {
                                recogniseImage()
                            }
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
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("navigation-back")
        }))
    }
    
    private func recogniseImage() {
        guard let birdImage = image else { return }
        let recognitionTool = BirdRecognitionTool.shared
        let result = recognitionTool.recognise(bird: birdImage)
        print("\(String(describing: result))")
        self.isShowResult = true

    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "EMU0.jpg")
    
    static var previews: some View {
        PhotoDetailView(image: $image)
    }
}
