//
//  TMTextField.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class TMTextField:SkyFloatingLabelTextField {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.lineColor = UIColor.appColor
        self.textColor = UIColor.appColor
        self.titleColor = UIColor.appColor
        self.placeholderColor = UIColor.gray
        
        
    }
    
    
    
    
}
