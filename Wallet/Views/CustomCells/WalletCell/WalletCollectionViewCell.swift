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
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        walletBackgroundView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
    }

}
