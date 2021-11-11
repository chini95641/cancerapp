//
//  AboutViewController.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.textView.delegate = self
        
        self.navigationItem.title = "About the Calculator"
        self.textView.isEditable = false
        self.textView.isUserInteractionEnabled = true
        self.textView.attributedText = setupContentForAboutPage()
        
    }
    
    
    func setupContentForAboutPage() -> NSAttributedString {
        
        let boldAtt = [NSAttributedString.Key.foregroundColor:UIColor.appLabel,NSAttributedString.Key.font:UIFont.question]
        
        
        let ansAtt = [NSAttributedString.Key.foregroundColor:UIColor.appLabel,NSAttributedString.Key.font:UIFont.answer]

        
        let att = NSMutableAttributedString()
        
        att.append(NSAttributedString.init(string: "How is this calculator to be used?\n\n",attributes: boldAtt))
        att.append(NSAttributedString.init(string: " This calculator should be used for patients who have visible or non-visible haematuria that have been referred to secondary care for the investigation of suspected urinary tract cancer. It should not be used for patients that have any history of urological malignancy or being are referred for suspected recurrence of urological malignancy.\n\n\n",attributes: ansAtt))
        
        
    
        att.append(NSAttributedString.init(string: "How do I use the calculator?\n\n",attributes: boldAtt))
        att.append(NSAttributedString.init(string: "Fill in the details of the patient, including their age in years, if they have visible haematuria or not, if they are male or female etc.\n\n\n",attributes: ansAtt))
        
        
        

        att.append(NSAttributedString.init(string: "What is the output of the calculator?\n\n",attributes: boldAtt))

        att.append(NSAttributedString.init(string: "The calculator will give you the patient’s predicted risk of urinary tract cancer, as well as their risk category. A threshold of less than 1% predicted risk was selected for the very low group. We used 5% and 20% predicted risk as cut-offs to create low, intermediate, and high-risk groups.\n\n\n",attributes: ansAtt))

        
        
        att.append(NSAttributedString.init(string: "How should I interpret the output of the calculator?\n\n",attributes: boldAtt))

        att.append(NSAttributedString.init(string: "The risk categories are guides only, and the predicted risk that is calculated should be discussed with the patient and the clinician to agree together how best to proceed with further investigation, if required.\n\n\n",attributes: ansAtt))

        
        
        att.append(NSAttributedString.init(string: "How do I know this calculator is accurate? \n\n",attributes: boldAtt))
        att.append(NSAttributedString.init(string: "No predictive model in medicine is perfect. Model performance is assessed in many ways, but commonly the area under the receiver operating characterisatic curve is used (AUC). The AUC of this model in the IDENTIFY Cohort was 0.86 which is good. The model has been internally validated using bootstrapping.\n\n\n",attributes: ansAtt))
        
        
        
        
        att.append(NSAttributedString.init(string: "Reference to Corresponding Peer-reviewed Publication in BJUI: Khadhouri, S., Gallagher, K., MacKenzie, K., Shah, T., Gao, C., & Moore, S. et al. (2021). The IDENTIFY Study: The Investigation and Detection of Urological Neoplasia in Patients Referred with Suspected Urinary Tract Cancer; A multicentre observational study. BJU International. doi: 10.1111/bju.15483\n\n\n",attributes: [NSAttributedString.Key.font:UIFont.answer,NSAttributedString.Key.foregroundColor:UIColor.appLink,NSAttributedString.Key.underlineStyle:NSUnderlineStyle.single.rawValue, NSAttributedString.Key.underlineColor:UIColor.appLink,NSAttributedString.Key.link:URL.init(string: "https://bjui-journals.onlinelibrary.wiley.com/doi/abs/10.1111/bju.15483")!]))

        
        att.append(NSAttributedString.init(string: "Disclaimer: The IDENTIFY Urinary Tract Cancer Prediction calculator provides an estimated prediction for urinary tract cancer based on collected multi-centre data. This calculator should not be used in isolation but as part of an overall clinical desicion making process involving multi-disciplinary professionals. BURST Urology is not responsible for descisions made by healthcare professionals or patients and consequential outcomes through the use of this predication calculator.",attributes: ansAtt))

        
        
        
        return att
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

extension AboutViewController:UITextViewDelegate {
    
 
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
 
        return true
        
    }

    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        return true
    }
    
    
}
