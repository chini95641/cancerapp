//
//  ColorExtension.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit


extension UIColor {
    
    
    static let appColor = UIColor.init(named: "AccentColor")!
    
    
    static let lowRisk = UIColor.init(named: "riskLow")!
    static let intermediateRisk = UIColor.init(named: "riskIntermediate")!
    static let highRisk = UIColor.init(named: "riskHigh")!
    
    static var appLabel:UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            // Fallback on earlier versions
            return UIColor.black
        }
    }
    static var appLink:UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.link
        } else {
            // Fallback on earlier versions
            return UIColor.blue
        }
    }
    
}
