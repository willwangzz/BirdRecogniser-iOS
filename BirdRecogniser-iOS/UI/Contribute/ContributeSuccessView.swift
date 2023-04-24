//
//  ContributeSuccessView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeSuccessView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ContributeTitleView()
                Spacer()
                ContributeSubmittedView()
                    .coordinateSpace(name: "ContributeSubmittedView")
                    .frame(height: geo.size.width)
                Spacer()
                Button("OK") {
                    
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

struct ContributeSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ContributeSuccessView()
    }
}
