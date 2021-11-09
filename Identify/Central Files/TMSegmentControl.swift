//
//  TMSegmentControl.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit


class TMSegmentControl:UISegmentedControl {
    
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        
        let titleTextAttributes:[NSAttributedString.Key:Any]
        if #available(iOS 13.0, *) {
            titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
            self.selectedSegmentTintColor = UIColor.appColor

        } else {
            // Fallback on earlier versions
            titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        }
        
        self.tintColor = UIColor.appColor
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.setTitleTextAttributes(titleTextAttributes1, for: .selected)
        self.updateToMultiLine()
        
        
    }
    
    func updateToMultiLine() {
        
//        for i in 0...self.numberOfSegments - 1 {
//            if self.subviews.count <= self.numberOfSegments - 1 - i { return }
//            
//            let subV = self.subviews[self.numberOfSegments - 1 - i]
//            
//            if subV.subviews.count <= 1 { return }
//
//            
//          let label = subV.subviews[1] as? UILabel
//
//          label?.numberOfLines = 0
//        }
    }
    
    
}
