//
//  BRTabView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 7/04/23.
//

import SwiftUI

struct CustomTabItemView: View {
    let title: String
    let image: String
    let height: CGFloat

    var body: some View {
        
        VStack(spacing: 0) {
            Image(systemName: image)
                .font(.title)
            Text(title)
                .font(.caption)
        }
        .frame(height: height)
        
    }
}

struct BRTabView: View {
    @State private var selectedTab = 0
    
    
    var body: some View {
            TabView(selection: $selectedTab) {
                RecogniserView()
                    .tabItem {
                        Image("tab-recogniser")
                        Text("Recognise")
                    }
                    .tag(1)
                Text("Middle View")
                    .tabItem {
                        Image("tab-camera")
                        Text("Take a Photo")
                    }
                    .tag(2)
                TakeImagesView()
                    .tabItem {
                        Image("tab-contribution")
                        Text("Contribution")
                    }
                    .tag(3)
                RecogniserDemoView()
                    .tabItem {
                        Image("tab-about")
                        Text("About us")
                    }
                    .tag(4)
            }
        }
}

struct BRTabView_Previews: PreviewProvider {
    static var previews: some View {
        BRTabView()
    }
}
