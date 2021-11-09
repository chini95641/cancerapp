//
//  RiskScore.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation


class RiskScore {

    var score = 0
    
    var probability = 0.0
    var probabilityString = ""

    var lowerLimit = 0.0
    var lowerLimitString = ""

    var upperLimit = 0.0
    var upperLimitString = ""
    
    
    var displayString:String {
        
        return "\(probabilityString) predicted risk of Urinary Tract Cancer."
    }

    init?(with dict:[String:Any]) {
        
        if let rs = dict["Risk score"] as? Int {
            self.score = rs
        } else if let rsString = dict["Risk score"] as? String, let rs = Int(rsString) {
            self.score = rs
        } else {
            return nil
        }

        self.probabilityString = dict["Probability of urinary tract cancer"] as? String ?? ""
        
        if let d = Double(self.probabilityString.replacingOccurrences(of: "%", with: "")) {

            self.probability = d
            
        } else {
            return nil
        }
        
        
        
        self.lowerLimitString = dict["Lower limit"] as? String ?? ""
        
        if let d = Double(self.lowerLimitString.replacingOccurrences(of: "%", with: "")) {

            self.lowerLimit = d
            
        } else {
            return nil
        }
        
        self.upperLimitString = dict["Upper limit"] as? String ?? ""
        
        if let d = Double(self.upperLimitString.replacingOccurrences(of: "%", with: "")) {

            self.upperLimit = d
            
        } else {
            return nil
        }
        
        
    }
    
}
