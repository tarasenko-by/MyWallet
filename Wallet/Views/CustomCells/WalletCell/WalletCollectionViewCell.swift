//
//  WalletCollectionViewCell.swift
//  Wallet
//
//  Created by Sergei Tarasenko on 28.12.2021.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var walletBackgroundView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    static let identifier = "WalletCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WalletCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
