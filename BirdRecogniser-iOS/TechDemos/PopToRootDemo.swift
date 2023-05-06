//
//  PopToRootDemo.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 6/05/23.
//

import SwiftUI

struct PopToRootDemo: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ContentView2(rootIsActive: self.$isActive),
                isActive: self.$isActive
            ) {
                Text("Hello, World!")
            }
            .isDetailLink(false)
            .navigationBarTitle("Root")
        }
    }
}

struct ContentView2: View {
    @Binding var rootIsActive: Bool
    
    var body: some View {
        NavigationLink(destination: ContentView3(shouldPopToRootView: self.$rootIsActive)){
            Text("Hello, World #2!")
        }
        .isDetailLink(false)
        .navigationTitle("Two")

    }
}

struct ContentView3: View {
    @Binding var shouldPopToRootView: Bool
    
    var body: some View {
        VStack {
            Text("Hello, World #3!")
            Button {
                self.shouldPopToRootView = false
            } label: {
                Text("Pop to root")
            }

        }.navigationTitle("Three")
    }
    
}

struct PopToRootDemo_Previews: PreviewProvider {
    static var previews: some View {
        PopToRootDemo()
    }
}
