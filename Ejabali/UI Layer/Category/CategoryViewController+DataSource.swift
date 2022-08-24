//
//  CategoryViewController+DataSource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 12/08/22.
//

import UIKit

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryTop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.identifier, for: indexPath) as? ItemCollectionCell ?? ItemCollectionCell()
        let url = URL(string: categoryTop[indexPath.row].img ?? "")
        cell.imageView.kf.setImage(with: url)
        cell.imageView.contentMode = .scaleAspectFill
        cell.itemNameLabel.text = categoryTop[indexPath.row].cat_name?.capitalizingFirstLetter()
        cell.itemNameLabel.numberOfLines = 2
//        cell.labelBottomConstraint.constant = 20
//        cell.labelTopConstraint.constant = 20
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width / 2), height: (UIScreen.main.bounds.size.width / 2) + 90)
    }
}
