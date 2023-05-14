//
//  ViewExtension.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 23/04/23.
//

import SwiftUI

extension View {
    func addRecogniseButtonBackgroundImage(_ imageName: String, aligment: Alignment = .bottomTrailing) -> some View {
        ZStack(alignment: aligment) {
            Image(imageName)
            
            self
        }
    }
    
    func addContributeSubmittedBackgroundImage() -> some View {
        ZStack(alignment: .bottomTrailing) {
            Image("contribute-submitted")
            
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

//MARK: - Button Style
extension View {
    func addButtonStyle(_ backgroundColor: UIColor) -> some View {
        self
            .foregroundColor(.white)
            .padding(.horizontal, 40.0)
            .frame(height: 40)
            .background(backgroundColor.toColor())
            .cornerRadius(20)
    }
}

//MARK: - Conditional Modifier

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
