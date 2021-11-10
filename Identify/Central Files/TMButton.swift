//
//  TMButton.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit


class TMButton:UIButton {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        self.layer.cornerRadius = 6.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.appColor
        self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.setTitleColor(UIColor.white, for: UIControl.State.selected)
        self.titleLabel?.font = UIFont.button
        
    }
    
}
