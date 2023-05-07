//
//  RecogniseResultDetailView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct RecogniseResultDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var image: UIImage?
    
    let birdResult: BirdRecognisitionResult
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                HStack {
                    Text(birdResult.name)
                        .font(Theme.textFont.toFont())
                    Spacer()
                    Text("Possibility: \(birdResult.possibility * 100, specifier: "%.4g")%")
                        .font(Theme.textFont.toFont())
                }
                if let _ = image {
                    Image(uiImage: image!)
                        .resizable()
                        .frame(width: geo.size.width - 60, height: (geo.size.width - 60) * (image?.size.height ?? 1) / (image?.size.width ?? 1))
                        .cornerRadius(30)
                }
                
                Rectangle()
                    .fill(.clear)
                    .frame(height: 10)
                
                Text("Tui are boisterous, medium-sized, common and widespread bird of forest and suburbia – unless you live in Canterbury. They look black from a distance, but in good light tui have a blue, green and bronze iridescent sheen, and distinctive white throat tufts (poi). ")
            }
            .padding(.horizontal, 30.0)
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
    }
    
}

struct RecogniseResultDetailView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "EMU0.jpg")
    
    static let result = BirdRecognisitionResult(name: "EMU", possibility: 0.980984848845875774)
    
    static var previews: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                RecogniseResultDetailView(image: $image, birdResult: result)
            }
        } else {
            RecogniseResultDetailView(image: $image, birdResult: result)
        }
        
    }
}
