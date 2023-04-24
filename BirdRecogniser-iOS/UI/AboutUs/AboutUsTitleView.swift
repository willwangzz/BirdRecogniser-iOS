//
//  AboutUsTitleView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct AboutUsTitleView: View {
    var body: some View {
        Text("About Us")
            .foregroundColor(Theme.mainColor?.toColor())
            .multilineTextAlignment(.center)
            .font(UIFont.systemFont(ofSize: 40, weight: .bold).toFont())
    }
}

struct AboutUsTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsTitleView()
    }
}
