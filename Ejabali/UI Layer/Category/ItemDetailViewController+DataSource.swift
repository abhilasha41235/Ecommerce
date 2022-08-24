//
//  ItemDetailViewController+DataSource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit
extension ItemDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableCell.identifier, for: indexPath) as? ImageViewTableCell ?? ImageViewTableCell()
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemDetailCell.identifier, for: indexPath) as? ItemDetailCell ?? ItemDetailCell()
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableCell.identifier, for: indexPath) as? ImageViewTableCell ?? ImageViewTableCell()
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HIghlightsTableCell.identifier, for: indexPath) as? HIghlightsTableCell ?? HIghlightsTableCell()
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableCell.identifier, for: indexPath) as? ImageViewTableCell ?? ImageViewTableCell()
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell ?? DescriptionTableViewCell()
            return cell
        }else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableCell.identifier, for: indexPath) as? ImageViewTableCell ?? ImageViewTableCell()
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        } else if indexPath.row == 1{
            return UITableView.automaticDimension
        } else if indexPath.row == 2 {
            return 50
        } else if indexPath.row == 3 {
            return UITableView.automaticDimension
        } else if indexPath.row == 4 {
            return 10
        } else if indexPath.row == 5 {
            if isMoreSelected {
                return UITableView.automaticDimension
            } else {
                return 100
            }
        } else if indexPath.row == 6 {
            return 50
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isMoreSelected = !isMoreSelected
        tableView.reloadData()
    }
}

