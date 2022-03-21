//
//  PageingReusableView.swift
//  Wallet
//
//  Created by Pavel Nadolski on 21.03.2022.
//

import UIKit

final class PageingReusableView: UICollectionReusableView {

    var pages:Int {
        get {
            return pageControll.numberOfPages
        }

        set {
            pageControll.numberOfPages = newValue
        }
    }

    var currentPage: Int {
        get {
            return pageControll.currentPage
        }

        set {
            pageControll.currentPage = newValue
        }
    }

    static func nib() -> UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }

    @IBOutlet private weak var pageControll: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
