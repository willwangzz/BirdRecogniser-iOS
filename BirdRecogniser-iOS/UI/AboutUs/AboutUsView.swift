//
//  AboutUsView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 24/04/23.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                ScrollView {
                    AboutUsTitleView()
                        .frame(width: geo.size.width)
                    
                    AboutUsContentView(title: "Our Purpose", content: "There are many beautiful birds around us, and whenever we see them, we love taking photos. However, we're also curious about their names, habits, and habitats, and there's no software that can identify them and provide us with this information. That's where Bird Recogniser comes in - it's a software system that can identify birds and provide clients with comprehensive information about them. With Bird Recogniser, you can learn everything you want to know about the birds that fly around you.", backgroundImageName: "aboutus-bird")
                        .frame(width: geo.size.width - 60)
                    
                    Rectangle().fill(.clear).frame(height: 20)
                    
                    AboutUsContentView(title: "Our Team", content: "Our team consists of experienced developers, designer and testers. We’re really concerned with generating better digital experiences and outcomes for our customers whether that be an app or otherwise.")
                        .frame(width: geo.size.width - 60)
                }
                .background(UIColor.clear.toColor())
                
            }
            .frame(width: geo.size.width)
        }
        .addMainGradientBackground()
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
