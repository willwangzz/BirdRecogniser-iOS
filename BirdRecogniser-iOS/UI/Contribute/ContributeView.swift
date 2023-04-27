//
//  ContributeView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeView: View {
    var isSubmitted: Bool = false
    var body: some View {
        if isSubmitted {
            ContributeSuccessView()
        } else {
            ContributeNewView(birdName: "", birdInfomation: "", photo: "")
        }
        
    }
}

struct ContributeView_Previews: PreviewProvider {
    static var previews: some View {
        ContributeView(isSubmitted: true)
    }
}
