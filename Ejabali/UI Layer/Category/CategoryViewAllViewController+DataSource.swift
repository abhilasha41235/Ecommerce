//
//  CategoryViewController+DataSource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 12/08/22.
//

import UIKit

extension CategoryViewAllViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            4
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.identifier, for: indexPath) as? ItemCollectionCell ?? ItemCollectionCell()
            cell.itemNameLabel.text = "Dummy Name"
            cell.itemNameLabel.textAlignment = .center
            ///let url = URL(string: mainCategoryModel?.u?[indexPath.row].image1 ?? "")
            cell.imageView.image = UIImage(named: "banner")//kf.setImage(with: url)
            cell.imageView.contentMode = .scaleAspectFill
            cell.baseView.dropShadow()
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let viewAllVC = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(identifier: "CategorySingleItemViewController")
            self.navigationController?.pushViewController(viewAllVC, animated: true)
        }
    }

    extension CategoryViewAllViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.size.width / 2), height: (UIScreen.main.bounds.size.width / 2) + 50)
        }
    }
