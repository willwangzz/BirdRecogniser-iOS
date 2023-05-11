//
//  RecogniseResultDetailView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct RecogniseResultDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let birdResult: BirdRecognisitionResult
    
    let showBottomLine: Bool
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10)
            
            HStack {
                Text(birdResult.name)
                    .font(Theme.textFont.toFont())
                Spacer()
                Text("Possibility: \(birdResult.possibility * 100, specifier: "%.4g")%")
                    .font(Theme.textFont.toFont())
            }
            
            Spacer()
                .frame(height: 10)
            
            Text("Tui are boisterous, medium-sized, common and widespread bird of forest and suburbia – unless you live in Canterbury. They look black from a distance, but in good light tui have a blue, green and bronze iridescent sheen, and distinctive white throat tufts (poi). ")
            
            if showBottomLine {
                Rectangle()
                    .background(Theme.mainColor?.toColor())
                    .frame(height: 0.5)
                Spacer()
                    .frame(height: 10)
                    
            }
        }
        .padding(.horizontal, 30.0)
    }
    
}

struct RecogniseResultDetailView_Previews: PreviewProvider {
    
    static let result = BirdRecognisitionResult(name: "EMU", possibility: 0.980984848845875774)
    
    static var previews: some View {
        RecogniseResultDetailView(birdResult: result, showBottomLine: true)
    }
}
