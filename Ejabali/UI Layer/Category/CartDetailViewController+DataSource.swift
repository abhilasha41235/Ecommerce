//
//  CartDetailViewController+DataSource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

import UIKit
extension CartDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderStatusTableViewCell.identifier, for: indexPath) as? OrderStatusTableViewCell ?? OrderStatusTableViewCell()
            return cell
        }  else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier, for: indexPath) as? AddressTableViewCell ?? AddressTableViewCell()
            return cell
        }  else if indexPath.row == 2 || indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NoOfItemTableViewCell.identifier, for: indexPath) as? NoOfItemTableViewCell ?? NoOfItemTableViewCell()
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceDetailTableViewCell.identifier, for: indexPath) as? PriceDetailTableViewCell ?? PriceDetailTableViewCell()
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }  else {
            return UITableView.automaticDimension
        }
    }
}

