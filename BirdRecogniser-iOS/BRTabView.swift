//
//  BRTabView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 7/04/23.
//

import SwiftUI

struct BRTabView: View {
    
    @State private var selectedTab = 0
    
    
    var body: some View {
            TabView(selection: $selectedTab) {
                RecogniserView()
                    .tabItem {
                        if selectedTab == 0 {
                            Image("tab-recogniser-selected")
                        } else {
                            Image("tab-recogniser")
                        }
                        Text("Recognise")
                    }
                    .tag(0)
                ContributeView()
                    .tabItem {
                        if selectedTab == 1 {
                            Image("tab-contribution-selected")
                        } else {
                            Image("tab-contribution")
                        }
                        Text("Contribute")
                    }
                    .tag(1)
                AboutUsView()
                    .tabItem {
                        if selectedTab == 2 {
                            Image("tab-about-selected")
                        } else {
                            Image("tab-about")
                        }
                        Text("About us")
                    }
                    .tag(2)
            }
            
        }
}

struct BRTabView_Previews: PreviewProvider {
    static var previews: some View {
        BRTabView()
    }
}
