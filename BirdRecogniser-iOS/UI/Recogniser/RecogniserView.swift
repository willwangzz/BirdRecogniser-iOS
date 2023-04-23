//
//  RecogniserView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 15/04/23.
//

import SwiftUI

struct RecogniserView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                HStack(alignment: .center) {
                    VStack {
                        RecogniserButton(title: "From Library",
                                         subtitle: "Select your photos from your library",
                                         note: "Select your photo",
                                         backgroundImageName: "recogniser-select-photo-background")
                        .frame(height: 185)
                        Rectangle()
                            .fill(.clear)
                            .frame(height: 30)
                        RecogniserButton(title: "Take a photo",
                                         subtitle: "Take a photo to recognise",
                                         note: "Take a photo",
                                         backgroundImageName: "recogniser-take-photo-background")
                        .frame(height: 185)
                    }
                    .padding(.all, 30.0)
                }
                .frame(height: geo.size.height)
            }
            .navigationTitle("Bird Recognition")
            .navigationBarTitleDisplayMode(.inline)
            .addMainGradientBackground()
        }
    }
}



struct RecogniserView_Previews: PreviewProvider {
    static var previews: some View {
        RecogniserView()
    }
}
