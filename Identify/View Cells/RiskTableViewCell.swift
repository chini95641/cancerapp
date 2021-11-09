//
//  RiskTableViewCell.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class RiskTableViewCell: UITableViewCell {

    @IBOutlet weak var selectionBottom: NSLayoutConstraint!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var selection: UISegmentedControl!
    @IBOutlet weak var name: UILabel!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var risk:Risk? = nil {
        
        didSet {
            guard let rsk = risk else {return }
            self.name.text = rsk.name
            if let sb = rsk.subTitle {
                self.subTitle.text = sb
                self.subTitle.isHidden = false
            } else {
                self.subTitle.isHidden = true
            }
            self.selection.removeAllSegments()
            

            for i in 0..<rsk.segments.count {
                
                self.selection.insertSegment(withTitle: rsk.segments[i], at: i, animated: false)
                if let s = rsk.selectedString, rsk.segments[i] == s {
                    self.selection.selectedSegmentIndex = i
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
