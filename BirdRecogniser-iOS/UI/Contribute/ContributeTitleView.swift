//
//  ContributeTitleView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeTitleView: View {
    var body: some View {
        Text("Found New?\nContribute New!")
            .foregroundColor(Theme.mainColor?.toColor())
            .multilineTextAlignment(.center)
            .font(UIFont.systemFont(ofSize: 40, weight: .bold).toFont())
            
        
    }
}

struct ContributeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContributeTitleView()
    }
}
