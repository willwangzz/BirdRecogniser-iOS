//
//  RecogniserView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 9/04/23.
//

import SwiftUI
import CoreML

struct RecogniserDemoView: View {
    @State var recogniserResult: [BirdRecognisitionResult]?
    
    var body: some View {
        VStack {
            Button {
                beginRecognising()
            } label: {
                Text("Begin recognition")
            }
            Spacer()
            if recogniserResult == nil {
                Text("Empty")
            } else {
                List(recogniserResult!, id: \.name) { result in
                    VStack {
                        Text(result.name)
                        Text("\(result.possibility)")
                    }
                }
            }
        }
        
    }
    
    func beginRecognising() {
        guard let image = UIImage(named: "EMU3.jpg") else { return }
        let result = BirdRecognitionTool.shared.recognise(bird: image)
        self.recogniserResult = result
    }
}

struct RecogniserDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RecogniserDemoView()
    }
}
