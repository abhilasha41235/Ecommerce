//
//  HomeViewController+TableDatasource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainCategoryModel?.count ?? 0 + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TopHorizontalTableViewCell.identifier, for: indexPath) as? TopHorizontalTableViewCell ?? TopHorizontalTableViewCell()
            cell.categoryTop = self.categoryTop
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath) as? BannerTableViewCell ?? BannerTableViewCell()
            cell.banner = self.banner
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.row > 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell ?? ItemTableViewCell()
            cell.mainCategoryModel = self.mainCategoryModel?[indexPath.row - 2] ?? MainCategoryModel()
            cell.headerTitleLabel?.text = self.mainCategoryModel?[indexPath.row - 2].type ?? ""
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 90
        } else if indexPath.row == 1 {
            return UIScreen.main.bounds.size.width / 1.9 + 20
        } else {
            return 580
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
