//
//  HeaderTableViewCell.swift
//  Wallet
//
//  Created by Sergei Tarasenko on 29.12.2021.
//

import UIKit

class HeaderTableViewCell: UICollectionReusableView {

    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var secondTextLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTextLabel.textColor = UIColor(named: "secondary")
        secondTextLabel.textColor = UIColor(named: "secondary")
        mainTextLabel.text = mainTextLabel.text?.capitalized
        secondTextLabel.text = secondTextLabel.text?.capitalized
    }
    
}
