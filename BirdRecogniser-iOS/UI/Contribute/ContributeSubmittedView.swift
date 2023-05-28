//
//  ContributeSubmittedView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeSubmittedView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Image("contribute-good")
                    .padding(.bottom)

                Text("Your Contribute has been submitted.")
                    .font(Font.system(size: 36, weight: .bold))
                    .foregroundColor(Theme.mainColor?.toColor())
                    .multilineTextAlignment(.center)
                
                
                Text("Thank you for your contribution!")
                    .font(Font.system(size: 20))
                    .foregroundColor(UIColor.init(hex: "#797979")?.toColor())
                    .padding(.top)
            }
            .frame(width: geo.size.width, height: geo.size.width)
            .addContributeSubmittedBackgroundImage()
            .background(Theme.creamColor?.toColor())
            .cornerRadius(30)
            .shadow(radius: Theme.shadowRadius)
        }
    }
}

struct ContributeSubmittedView_Previews: PreviewProvider {
    static var previews: some View {
        ContributeSubmittedView()
    }
}
