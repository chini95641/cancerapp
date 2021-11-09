//
//  Risk2TableViewCell.swift
//  Identify
//
//  Created by Sucharu on 09/11/21.
//

import UIKit

class Risk2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var selection: TMSegmentControl!
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
            
            self.selection.removeAllSegments()
            

            for i in 0..<rsk.segments.count {
                
                self.selection.insertSegment(withTitle: rsk.segments[i], at: i, animated: false)
                if let s = rsk.selectedString, rsk.segments[i] == s {
                    self.selection.selectedSegmentIndex = i
                }
            }
            self.selection.updateToMultiLine()
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
