//
//  UIImageExtension.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 9/04/23.
//

import UIKit

extension UIImage {
    func resize(to newSize: CGSize) -> UIImage? {

        guard self.size != newSize else { return self }

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))

        defer { UIGraphicsEndImageContext() }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
