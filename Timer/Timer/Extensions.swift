//
//  Extensions.swift
//  Timer
//
//  Created by Mallikarjun on 31/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    static func random() -> UIColor {
        
        let redValue: CGFloat = .random(in: 0...1)
        let greenValue: CGFloat = .random(in: 0...1)
        let blueValue: CGFloat = .random(in: 0...1)
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
