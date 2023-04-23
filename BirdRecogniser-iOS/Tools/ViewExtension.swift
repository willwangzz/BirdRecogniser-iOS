//
//  ViewExtension.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 23/04/23.
//

import SwiftUI

extension View {
    func addRecogniseButtonBackgroundImage(_ imageName: String) -> some View {
        ZStack(alignment: .bottomTrailing) {
            Image(imageName)
            
            self
        }
    }
}

extension View {
    func addMainGradientBackground() -> some View {
        self.background(LinearGradient(colors: [UIColor(hex: "#FDFEFE")!.withAlphaComponent(0).toColor(),
                                                UIColor(hex: "#D2DEDA")!.toColor()],
                                       startPoint: .top,
                                       endPoint: .bottom))
    }
}
