//
//  ContributeNewView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 25/04/23.
//

import SwiftUI

struct ContributeNewView: View {
    
    @Binding var isSubmitted: Bool
    
    @State var birdName: String
    @State var birdInfomation: String
    @State var photo: String
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ContributeTitleView()
                Spacer()
                TextField("Bird Name", text: $birdName)
                    .addCornerAndShadow()
                Spacer()
                    .frame(height: 43)
                TextField("Bird Information", text: $birdInfomation)
                    .addCornerAndShadow()
                Spacer()
                    .frame(height: 43)
                TextField("Update Photo", text: $photo)
                    .addCornerAndShadow()
                Spacer()
                Button("Contribute New") {
                    self.isSubmitted = true
                }
                .padding(.horizontal)
                .addButtonStyle(Theme.actionColor!)
                Spacer()
            }
            .frame(width: geo.size.width)
        }
        .padding(.horizontal, 30.0)
        .addMainGradientBackground()
    }
    
    
}

extension View {
    func addCornerAndShadow() -> some View {
        self
            .frame(height: 60)
            .padding(.horizontal)
            .background(UIColor.white.toColor())
            .cornerRadius(30)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 20)
    }
}

struct ContributeNewView_Previews: PreviewProvider {
    
    @State static var isSubmitted = true
    
    static var previews: some View {
        ContributeNewView(isSubmitted: $isSubmitted, birdName: "", birdInfomation: "", photo: "")
    }
}
