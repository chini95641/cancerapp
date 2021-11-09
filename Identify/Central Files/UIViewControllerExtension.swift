//
//  UIViewControllerExtension.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import Foundation
import UIKit
import SwiftMessages

extension UIViewController {
    
    
    func showSimpleAlertViewWithTitle(title:String , withMessage message:String , andSecondaryButtonTitle secondaryButtonTitle:String) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: secondaryButtonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func showWarningMessage(message:String) {
        
        
        
        if message == ""  { return }
        
        let view = MessageView.viewFromNib(layout: .cardView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.error)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        
        view.configureContent(title: "Warning!", body: message, iconText: "")
        view.button?.isHidden = true
        
        // Increase the external margin around the card. In general, the effect of this setting
        // depends on how the given layout is constrained to the layout margins.
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        // Reduce the corner radius (applicable to layouts featuring rounded corners).
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        
        view.backgroundColor = UIColor.clear
        
        
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 1.5)
        config.ignoreDuplicates = true
        
        
        // Show the message.
        SwiftMessages.show(config: config, view: view)
        //        self.showSimpleAlertViewWithTitle(title: "Warning!", withMessage: message, andSecondaryButtonTitle: "OK")
        
        
        
    }
    
    
    
}
