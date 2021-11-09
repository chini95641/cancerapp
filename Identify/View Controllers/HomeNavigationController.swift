//
//  HomeNavigationController.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class HomeNavigationController: UINavigationController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.appColor,NSAttributedString.Key.font:UIFont.navigationTitle]
        self.navigationBar.titleTextAttributes = attributes
        
        if #available(iOS 13.0, *) {
            self.navigationBar.standardAppearance.titleTextAttributes = attributes
            self.navigationBar.scrollEdgeAppearance?.titleTextAttributes = attributes

        } else {
            // Fallback on earlier versions
        }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
