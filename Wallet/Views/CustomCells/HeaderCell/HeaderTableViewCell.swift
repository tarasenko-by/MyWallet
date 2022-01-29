//
//  HeaderTableViewCell.swift
//  Wallet
//
//  Created by Sergei Tarasenko on 29.12.2021.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var secondTextLabel: UILabel!
    
    static let identifier = "HeaderTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTextLabel.textColor = UIColor(named: "secondary")
        secondTextLabel.textColor = UIColor(named: "secondary")
        mainTextLabel.text = mainTextLabel.text?.capitalized
        secondTextLabel.text = secondTextLabel.text?.capitalized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
