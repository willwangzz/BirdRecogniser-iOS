//
//  ContentView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 7/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            if #available(iOS 15, *) {
                Text("Hello, world!")
                    .background(Color.red)
            } else {
                Text("Hello, world!")
                    .background(Rectangle().fill(.red), alignment: .center)
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
