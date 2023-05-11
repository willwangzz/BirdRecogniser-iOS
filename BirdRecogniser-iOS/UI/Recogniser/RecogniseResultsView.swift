//
//  RecogniseResultsView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 11/05/23.
//

import SwiftUI

struct RecogniseResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var image: UIImage?
    
    @State var birdRecognitionResults: [BirdRecognisitionResult]?
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                if let _ = image {
                    Image(uiImage: image!)
                        .resizable()
                        .frame(width: geo.size.width - 60, height: (geo.size.width - 60) * (image?.size.height ?? 1) / (image?.size.width ?? 1))
                        .cornerRadius(30)
                        .padding(.horizontal, 30)
                }
                if let results = birdRecognitionResults {
                    ForEach(Array(results.enumerated()), id: \.offset) { index, result in
                        RecogniseResultDetailView(birdResult: result, showBottomLine: (index != results.count - 1))
                    }
                }
                
            }
        }
        .navigationTitle("Result")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.image = nil
        }, label: {
            Image("navigation-back")
        }))
        .addMainGradientBackground()
        .onAppear {
            Task {
                await recogniseImage()
            }
        }
    }
    
    private func recogniseImage() async {
        guard let birdImage = image else { return }
        let recognitionTool = BirdRecognitionTool.shared
        let result = await recognitionTool.recognise(bird: birdImage)
        self.birdRecognitionResults = result

    }
}

struct RecogniseResultsView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "EMU0.jpg")
    
    static let result = BirdRecognisitionResult(name: "EMU", possibility: 0.980984848845875774)
    
    static var previews: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                RecogniseResultsView(image: $image)
            }
        } else {
            RecogniseResultsView(image: $image)
        }
        
    }
}
