//
//  ContributeBirdImageView.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 13/05/23.
//

import SwiftUI

struct ContributeBirdImageView: View {
    
    @Binding var image: UIImage?
    
    var body: some View {
        if let im = image {
            Image(uiImage: im)
        } else {
            Text("AA")
        }
    }
}

struct ContributeBirdImageView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "EMU3.jpg")
    
    static var previews: some View {
        ContributeBirdImageView(image: $image)
    }
}
