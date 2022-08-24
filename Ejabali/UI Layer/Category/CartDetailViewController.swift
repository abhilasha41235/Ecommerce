//
//  CartDetailViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class CartDetailViewController: UIViewController {
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
        setUpNavigation()
    }
    
    func setUpNavigation() {
        let view = UIView()
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: "Back"), for: .normal)
            button.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
            button.sizeToFit()
            view.addSubview(button)
            view.frame = button.bounds
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Cart Detail"
    }
    
    @objc func onBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueAction(_ sender: Any) {
    }
    
    @IBAction func totalAction(_ sender: Any) {
    }
    
    func registerCell() {
        tableView.register(OrderStatusTableViewCell.nib, forCellReuseIdentifier: OrderStatusTableViewCell.identifier)
        tableView.register(AddressTableViewCell.nib, forCellReuseIdentifier: AddressTableViewCell.identifier)
        tableView.register(NoOfItemTableViewCell.nib, forCellReuseIdentifier: NoOfItemTableViewCell.identifier)
        tableView.register(PriceDetailTableViewCell.nib, forCellReuseIdentifier: PriceDetailTableViewCell.identifier)
    }
}
