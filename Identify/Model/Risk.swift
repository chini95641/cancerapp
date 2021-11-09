//
//  Risk.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation






class Risk {
    
    
    var name = ""
    var subTitle:String? = nil
    var selectedString:String? = nil
    var segments:[String] = []
    
    init(with name:String,with list:[String]) {
        
        self.name = name
        self.selectedString = nil
        self.segments = list
        
    }
    init(withName name:String, andSubTitle subtitle:String?) {
        
        self.name = name
        self.selectedString = nil
        self.subTitle = subtitle
        self.segments = ["NO","YES"]
    }
    
    
    
    static func getContent() -> [Risk] {
        
        var list = [Risk]()
        list.append(Risk.init(withName: "Non-visible haematuria/Visible haematuria", andSubTitle: "In the absence of visible haematuria calculator assumes presence of non-visible haematuria"))
        list.append(Risk.init(with: "Sex", with: ["FEMALE","MALE"]))

        list.append(Risk.init(with: "Smoking History", with: ["NO","EX-SMOKER","CURRENT SMOKER"]))
        
        list.append(Risk.init(with: "Family history of Urothelial Cancer",with:["NO","YES"]))
        list.append(Risk.init(with: "Previous benign investigation of haematuria",with:["NO","YES"]))
//        list.append(Risk.init(with: "Lower urinary tract symptoms",with: ["NONE","VOIDING/OBSTRUCTIVE","STORAGE/IRRITATIVE","MIXED"]))
        list.append(Risk.init(with: "Urinary tract infection (UTI) associated with haematuria episode",with: ["NO","SINGLE UTI","RECURRENT UTIs"]))
        
        list.append(Risk.init(with: "Catheter use",with: ["NO","YES"]))
        list.append(Risk.init(with: "Previous pelvic radiotherapy",with: ["NO","YES"]))
        list.append(Risk.init(with: "Anticoagulation",with: ["NO","YES"]))

        return list
        
    }
    
    
}
