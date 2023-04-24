//
//  RecogniseResultDetailView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct RecogniseResultDetailView: View {
    
    var image: UIImage
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    HStack {
                        Text("Tui")
                            .font(Theme.textFont.toFont())
                        Spacer()
                        Text("Possibility: 95%")
                            .font(Theme.textFont.toFont())
                    }
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: geo.size.width - 60, height: geo.size.width - 60)
                        .cornerRadius(30)
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 10)
                    
                    Text("Tui are boisterous, medium-sized, common and widespread bird of forest and suburbia – unless you live in Canterbury. They look black from a distance, but in good light tui have a blue, green and bronze iridescent sheen, and distinctive white throat tufts (poi). ")
                }
                .padding(.horizontal, 30.0)
            }
            .navigationTitle("Result")
            .navigationBarTitleDisplayMode(.inline)
            .addMainGradientBackground()
        }
    }
    
}

struct RecogniseResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecogniseResultDetailView(image: UIImage(named: "EMU0.jpg")!)
    }
}
