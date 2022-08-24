//
//  ItemDetailViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var isMoreSelected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        registerCell()
        self.tabBarController?.tabBar.isHidden = true
        setUpNavigation()
        addToCartButton.dropShadow()
        buyNowButton.dropShadow()
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
        self.title = "Item Detail"

    }
    
    @objc func onBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func registerCell() {
        tableView.register(ImageViewTableCell.nib, forCellReuseIdentifier: ImageViewTableCell.identifier)
        tableView.register(ItemDetailCell.nib, forCellReuseIdentifier: ItemDetailCell.identifier)
        tableView.register(HIghlightsTableCell.nib, forCellReuseIdentifier: HIghlightsTableCell.identifier)
        tableView.register(DescriptionTableViewCell.nib, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
    }
    
    @IBAction func buyNowAction(_ sender: Any) {
        let cartDetailViewController = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(identifier: "CartDetailViewController")
        self.navigationController?.pushViewController(cartDetailViewController, animated: true)
    }
    
    @IBAction func addToCartAction(_ sender: Any) {
    }
}
