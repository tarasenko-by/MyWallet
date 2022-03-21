//
//  TransactionViewController.swift
//  Wallet
//
//  Created by Pavel Nadolski on 19.03.2022.
//

import UIKit

class TransactionViewController: UIViewController {

    var collectionView: UICollectionView!
    var currentScrollOffset:CGFloat = 0 {
        didSet {
            let inset:CGFloat = 6
            let indexPath = IndexPath(item: 0, section: 0)
            if let attr = self.collectionView.layoutAttributesForItem(at: indexPath) {
              let cellWidth = attr.bounds.width
              let centerCell = cellWidth / 2
              let result = Int((currentScrollOffset + centerCell) / (cellWidth + inset))
                pageingReusableView?.currentPage = result
            }
        }
    }
    var pageingReusableView:PageingReusableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavItem()
        configureHierarchy()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TransactionViewController {
    func configureNavItem() {
        navigationItem.title = "Mounth"
    }

    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(WalletCollectionViewCell.nib(), forCellWithReuseIdentifier: String(describing: WalletCollectionViewCell.self))
        collectionView.register(TransactionTableViewCell.nib(), forCellWithReuseIdentifier: String(describing: TransactionTableViewCell.self))
        collectionView.register(HeaderTableViewCell.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderTableViewCell.self))
        collectionView.register(PageingReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: PageingReusableView.self))
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }

    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection

            // orthogonal scrolling section of images
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.88), heightDimension: .absolute(111))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

                if let footer = self.sectionFooter() {
                    section.boundarySupplementaryItems = [footer]
                }

                section.visibleItemsInvalidationHandler = {visibleItems, scrollOffset, environment in
                    self.currentScrollOffset = scrollOffset.x
                }
            // outline
            } else {
                let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)

                section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
                if let header = self.sectionHeader() {
                    section.boundarySupplementaryItems = [header]
                }
            }

            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }

    private func sectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem? {
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return header
    }

    private func sectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem? {
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return header
    }
}
extension TransactionViewController : UICollectionViewDelegate {
}

extension TransactionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WalletCollectionViewCell.self), for: indexPath)
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TransactionTableViewCell.self), for: indexPath)
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleSupplementaryView.describing(), for: indexPath) as? TitleSupplementaryView else { return UICollectionReusableView()}
//        view.setTitle(title: dataSource.titleForHeader(on: indexPath))
//        view.backgroundColor = .clear
//        return view
        if kind == UICollectionView.elementKindSectionHeader {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as? HeaderTableViewCell else { return UICollectionReusableView()}
            return view

        } else if kind == UICollectionView.elementKindSectionFooter {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: PageingReusableView.self), for: indexPath) as? PageingReusableView else { return UICollectionReusableView()}
            view.pages = 5
            view.currentPage = 0
            self.pageingReusableView = view
            return view
        }
        return UICollectionReusableView()
    }
}
