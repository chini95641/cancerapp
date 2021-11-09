//
//  ResultViewController.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var probabilityLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.resultLabel.text = RiskCalculator.shared.resultString
        self.probabilityLabel.text = RiskCalculator.shared.riskScore?.displayString
        self.resultLabel.textColor = RiskCalculator.shared.riskColor
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToHomePressed(_ sender: UIButton) {
    
    
        self.navigationController?.popToRootViewController(animated: true)
    
    }
    
}
