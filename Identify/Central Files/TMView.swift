//
//  TMView.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit

class TMView:UIView {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 12.0
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
}
