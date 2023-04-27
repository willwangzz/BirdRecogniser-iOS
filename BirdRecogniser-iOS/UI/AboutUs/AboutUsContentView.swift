//
//  AboutUsContentView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct AboutUsContentView: View {
    
    var title: String
    var content: String
    var backgroundImageName: String?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Theme.mainColor?.toColor())
                .font(Theme.miniHeaderFont.toFont())
            Spacer()
                .frame(height: 5)
            Text(content)
                .foregroundColor(UIColor.init(hex: "#738687")?.toColor())
                .font(Theme.nanoHeaderFont.toFont())
                .padding(.top, 1.0)
            
            Rectangle()
                .fill(.clear)
                .frame(height: 20)
        }
        .padding([.top, .leading, .trailing], 30.0)
        .if(backgroundImageName != nil) { view in
            view.addRecogniseButtonBackgroundImage(backgroundImageName!, aligment: .bottomLeading)
        }
        .background(Theme.creamColor?.toColor())
        .cornerRadius(30)
        .shadow(radius: Theme.shadowRadius)
    }
}

struct AboutUsContentView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsContentView(title: "Our Purpose", content: "There are many beautiful birds around us, and whenever we see them, we love taking photos. However, we're also curious about their names, habits, and habitats, and there's no software that can identify them and provide us with this information. That's where Bird Recogniser comes in - it's a software system that can identify birds and provide clients with comprehensive information about them. With Bird Recogniser, you can learn everything you want to know about the birds that fly around you.", backgroundImageName: "aboutus-bird")
    }
}
