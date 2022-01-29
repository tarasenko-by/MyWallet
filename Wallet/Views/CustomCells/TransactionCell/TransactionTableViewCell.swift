//
//  TransactionTableViewCell.swift
//  Wallet
//
//  Created by Sergei Tarasenko on 27.12.2021.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    static let identifier = "TransactionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TransactionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.textColor = UIColor(named: "primary")
        amountLabel.textColor = UIColor(named: "primary")
        descriptionLabel.textColor = UIColor(named: "secondary")
        currencyLabel.textColor = UIColor(named: "secondary")
        categoryImageView?.image = UIImage(named: "noImage")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
