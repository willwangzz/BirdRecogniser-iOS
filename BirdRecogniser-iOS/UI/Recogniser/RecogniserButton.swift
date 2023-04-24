//
//  RecogniserButton.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 15/04/23.
//

import SwiftUI

struct RecogniserButton: View {
    
    let titleFont = Font(UIFont.systemFont(ofSize: 20, weight: .medium))
    let subtitleFont = Font(UIFont.systemFont(ofSize: 14, weight: .medium))
    
    let title: String
    let subtitle: String
    let note: String
    let backgroundImageName: String
    
    var body: some View {
        GeometryReader { geo in

            VStack(alignment: .leading) {
                Text(title)
                    .font(Theme.miniHeaderFont.toFont())
                Text(subtitle)
                    .font(Theme.textFont.toFont())
                    .foregroundColor(UIColor(hex: "#738687")!.toColor())
                    .padding(.top, 1.0)
                Spacer()
                Text(note)
                    .font(Theme.textFont.toFont())
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .frame(height: 26)
                    .background(Theme.actionColor?.toColor())
                    .cornerRadius(13)
            }
            .padding(.all, 30.0)
        }
        .addRecogniseButtonBackgroundImage(backgroundImageName)
        .background(UIColor(hex: "#F6F3EE")!.toColor())
        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: Theme.shadowRadius)
        .coordinateSpace(name: "MainZStack")
    }
}

struct RecogniserButton_Previews: PreviewProvider {
    static var previews: some View {
        RecogniserButton(title: "From Library", subtitle: "Select your photos from your library", note: "Select your photo", backgroundImageName: "recogniser-select-photo-background")
    }
}
