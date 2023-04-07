//
//  BRTabView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 7/04/23.
//

import SwiftUI

//struct CustomTabViewStyle: TabViewStyle {
//    static func _makeView<SelectionValue>(value: _GraphValue<_TabViewValue<CustomTabViewStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue : Hashable {
//        <#code#>
//    }
//
//    static func _makeViewList<SelectionValue>(value: _GraphValue<_TabViewValue<CustomTabViewStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue : Hashable {
//        <#code#>
//    }
//}

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
        .background(.red)
    }
}

struct BRTabView: View {
    @State private var selectedTab = 0
    
    
    var body: some View {
            TabView(selection: $selectedTab) {
                Text("First View")
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("First")
                    }
                    .tag(0)

                Text("Second View")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Second")
                    }
                    .tag(1)
                Text("Middle View")
                    .tabItem {
                        Image("icon")
                    }
                    .tag(2)
                Text("Fourth View")
                    .tabItem {
                        Image(systemName: "4.circle")
                        Text("Fourth")
                    }
                    .tag(3)
                Text("Fifth View")
                    .tabItem {
                        Image(systemName: "5.circle")
                        Text("Fifth")
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
