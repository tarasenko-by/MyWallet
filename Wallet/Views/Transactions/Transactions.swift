////
////  Transactions.swift
////  Wallet
////
////  Created by Sergei Tarasenko on 27.12.2021.
////
//
//import UIKit
//
//class Transactions: UIViewController{
//    
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    let category = ["Еда и напитки", "Коммунальные платежи", "Инвестиции"]
//    let desc = ["Сходил на свидание", "", "Вкинулся в Эпл"]
//    let amount = ["- 520", "- 418", "- 10"]
//    let currency = ["USD", "BYN", "RUB"]
//
//    private let floatingButton: UIButton = {
//        let button = UIButton( frame: CGRect(x: 0, y: 0, width: 56, height: 56))
//        button.backgroundColor = .systemBlue
//        let image = UIImage(named: "add_button")
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        button.setTitleColor(.white, for: .normal)
//        button.layer.shadowRadius = 10
//        button.layer.shadowOpacity = 0.2
//        button.layer.shadowColor = UIColor.blue.cgColor
//        button.layer.shadowOffset = CGSize(width: 0, height: 10)
//        button.layer.cornerRadius = 30
//        return button
//    }()
//    
//    private let pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.numberOfPages = 5
//        pageControl.backgroundColor = .systemBlue
//        return pageControl
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(floatingButton)
//        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.backgroundColor = UIColor(named: "background")
//        self.tableView.register(WalletTableViewCell.nib(), forCellReuseIdentifier: WalletTableViewCell.identifier)
//        self.tableView.register(TransactionTableViewCell.nib(), forCellReuseIdentifier: TransactionTableViewCell.identifier)
//        self.tableView.register(HeaderTableViewCell.nib(), forCellReuseIdentifier: HeaderTableViewCell.identifier)
//
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        floatingButton.frame = CGRect(x: view.frame.size.width - 72, y: view.frame.size.height - 72 - view.safeAreaInsets.bottom, width: 56, height: 56)
//        pageControl.frame = CGRect(x: 10, y: view.frame.size.height - 100 - view.safeAreaInsets.bottom, width: view.frame.size.width - 20, height: 70)
//    }
//    
//    @objc private func didTapButton(){
//        var dialogMessage = UIAlertController(title: "Button Work", message: "Make sigway", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default)
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//        dialogMessage.addAction(ok)
//        dialogMessage.addAction(cancel)
//        self.present(dialogMessage, animated: true, completion: nil)
//    }
//}
//
//
//// MARK: TableView Delegate and DataSource
//
//extension Transactions: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
//        headerCell.mainTextLabel.text = dateToString(Date())
//        headerCell.secondTextLabel.text = "-314"
//        return headerCell
//    }
//    
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section > 0 {
//            return 32
//        } else {
//            return 0
//        }
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else {
//            return category.count
//        }
//    }
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.section == 0  {
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as? WalletTableViewCell{
//                return cell
//            }
//        } else {
//            if let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell {
//                cell.categoryLabel.text = self.category[indexPath.row]
//                cell.descriptionLabel.text = self.desc[indexPath.row]
//                cell.amountLabel.text = self.amount[indexPath.row]
//                cell.currencyLabel.text = self.currency[indexPath.row]
//                return cell
//             }
//        }
//        return TransactionTableViewCell()
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            
//            // Confirm Delete Modal
//            var dialogMessage = UIAlertController(title: "Delete Transation?", message: "Are you sure you want to delete this?", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default)
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//            dialogMessage.addAction(ok)
//            dialogMessage.addAction(cancel)
//            self.present(dialogMessage, animated: true, completion: nil)
//            //
//            
//        }
//    }
//    
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)")
//    }
//    
//}
