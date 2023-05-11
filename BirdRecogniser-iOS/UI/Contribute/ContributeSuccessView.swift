//
//  ContributeSuccessView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeSuccessView: View {
    
    @Binding var isSubmitted: Bool
    
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
                    self.isSubmitted = !self.isSubmitted
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
    @State static var isSubmitted = true
    
    static var previews: some View {
        ContributeSuccessView(isSubmitted: $isSubmitted)
    }
}
