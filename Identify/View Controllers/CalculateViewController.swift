//
//  CalculateViewController.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var calculateRisk: UIButton!
    @IBOutlet weak var age: TMTextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     
        self.age.placeholder = "Input age (over 16 years)"
        self.age.title  = "Age"
        self.age.delegate = self
        self.age.keyboardType = .numberPad
        self.setupContentForScreen()
        
        
    }
    
    
    func setupContentForScreen() {
        
        self.tableView.register(RiskTableViewCell.nib, forCellReuseIdentifier: RiskTableViewCell.identifier)
        self.tableView.register(Risk2TableViewCell.nib, forCellReuseIdentifier: Risk2TableViewCell.identifier)

        RiskCalculator.shared.reset()
        
        self.tableView.reloadData()
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
    
        
        self.view.endEditing(true)
        
        RiskCalculator.shared.performCalculation { error in
            
            if error != nil {
                self.showWarningMessage(message: error!)
            } else {
                
                if let vc = self.storyboard!.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
            }
            
            
        }
        
        
    
    
    
    }
    
}
extension CalculateViewController:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        RiskCalculator.shared.age = Int(textField.text!) ?? 0
        
    }
    
    
}

extension CalculateViewController:UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RiskCalculator.shared.risks.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if RiskCalculator.shared.risks[indexPath.row].segments.count == 2 && indexPath.row != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RiskTableViewCell.identifier, for: indexPath) as! RiskTableViewCell
            
            cell.risk = RiskCalculator.shared.risks[indexPath.row]
            cell.selection.tag = indexPath.row
            cell.selection.addTarget(self, action: #selector(userMadeTheSelection(with:)), for: UIControl.Event.valueChanged)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Risk2TableViewCell.identifier, for: indexPath) as! Risk2TableViewCell
            
            cell.risk = RiskCalculator.shared.risks[indexPath.row]
            cell.selection.tag = indexPath.row
            cell.selection.addTarget(self, action: #selector(userMadeTheSelection(with:)), for: UIControl.Event.valueChanged)
            return cell
        }
        
  
        
    }
    
    @objc func userMadeTheSelection(with selection:UISegmentedControl) {
        

        self.view.endEditing(true)
        
        switch selection.tag {
            
        case 0:
            RiskCalculator.shared.visibleHaematuria = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 1:
            RiskCalculator.shared.gender = GenderState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 2:
            RiskCalculator.shared.smoking = SmokingState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 3:
            RiskCalculator.shared.familyHistory = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 4:
            RiskCalculator.shared.previousBenign = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none

        case 5:
//            RiskCalculator.shared.tractSymptoms = TractSymptomsState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
            
            RiskCalculator.shared.utiState = UTIState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none

        case 6:
            RiskCalculator.shared.catheterUse = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 7:
            RiskCalculator.shared.previousPelvicRadiotherapy = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none
        case 8:
            RiskCalculator.shared.anticoagulation = BooleanState.init(rawValue: Double(selection.selectedSegmentIndex)) ?? .none

        default:
            break
            
            
        }
        RiskCalculator.shared.updateValues()
        
        
        self.tableView.reloadData()
    }
    
    
    
}

