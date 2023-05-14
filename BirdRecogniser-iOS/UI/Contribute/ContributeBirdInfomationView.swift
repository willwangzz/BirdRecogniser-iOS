//
//  ContributeBirdInfomationView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 14/05/23.
//

import SwiftUI

struct ContributeBirdInfomationView: View {
    
    @Binding var birdInfomation: String
    
    @State var info: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            TextEditor(text: $birdInfomation)
                .font(Theme.miniHeaderFont.toFont())
            if birdInfomation.count == 0 {
                Text("Information")
                    .font(Theme.miniHeaderFont.toFont())
                    .foregroundColor(UIColor(hex: "#C8C8CA")?.toColor())
                    .offset(x: 5, y: 8)
            }
        }
        .padding(.vertical, 10)
    }
}

struct ContributeBirdInfomationView_Previews: PreviewProvider {
    @State static var birdInfomation: String = ""
    
    static var previews: some View {
        ContributeBirdInfomationView(birdInfomation: $birdInfomation)
    }
}
