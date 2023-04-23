//
//  UIColorExtension.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 15/04/23.
//

import UIKit
import SwiftUI

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            let hexCount = hexColor.count
            
            if hexCount == 8 || hexCount == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    if hexCount == 8 {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255
                    } else {
                        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                        b = CGFloat(hexNumber & 0x0000ff) / 255
                        a = 1
                    }
                    

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    public func toColor() -> Color {
        if #available(iOS 15, *) {
            return Color(uiColor: self)
        } else {
            return Color(self)
        }
        
    }
}
