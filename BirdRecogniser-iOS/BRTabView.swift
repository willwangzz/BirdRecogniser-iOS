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
                    .tag(0)
                ContributeView()
                    .tabItem {
                        Image("tab-contribution")
                        Text("Contribution")
                    }
                    .tag(1)
                AboutUsView()
                    .tabItem {
                        Image("tab-about")
                        Text("About us")
                    }
                    .tag(2)
                RecogniserDemoView()
                    .tabItem {
                        Image("tab-recogniser")
                        Text("RecogniseDemo")
                    }
                    .tag(3)
            }
            
        }
}

struct BRTabView_Previews: PreviewProvider {
    static var previews: some View {
        BRTabView()
    }
}
