//
//  Helper.swift
//  Shipment Calc
//
//  Created by Aleksandrs Muravjovs on 28/02/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import Foundation
import UIKit

//App main colors in HEX:
//222831
//393e46
//00adb5
//eeeeee

class Helper {
    
    func hexStringToUIColor (hex:String, alpha: Float) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
}
