//
//  ContributeView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct ContributeView: View {
    @State var isSubmitted: Bool = false
    
    var body: some View {
        if isSubmitted {
            ContributeSuccessView(isSubmitted: $isSubmitted)
        } else {
            ContributeNewView(isSubmitted: $isSubmitted, birdName: "", birdInfomation: "", photo: "")
        }
        
    }
}

struct ContributeView_Previews: PreviewProvider {
    @State static var isSubmitted = false
    
    static var previews: some View {
        ContributeView()
    }
}
