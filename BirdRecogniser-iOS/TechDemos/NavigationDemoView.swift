//
//  NavigationDemoView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 29/04/23.
//

import SwiftUI

struct NavigationDemoView: View {
    @State var active: Bool = false
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: EmptyView()) {
//                    Label("Badge", systemImage: "app.badge")
//                }
//                NavigationLink("General", destination: EmptyView())
//                NavigationLink("About", destination: EmptyView(), isActive: $active)
//            }
//        }
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("View1")
                NavigationLink(destination: AboutUsView()){
                    Text("View2")
                }
            }
        }
    }
    
}

struct NavigationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDemoView()
    }
}
