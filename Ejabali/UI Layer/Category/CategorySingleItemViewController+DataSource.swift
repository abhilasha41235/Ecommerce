//
//  CategoryViewController+DataSource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 12/08/22.
//

import UIKit

extension CategorySingleItemViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategorySingleItemCollectionViewCell.identifier, for: indexPath) as? CategorySingleItemCollectionViewCell ?? CategorySingleItemCollectionViewCell()
            cell.baseView.dropShadow()
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let singleItemVC = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(identifier: "ItemDetailViewController")
            self.navigationController?.pushViewController(singleItemVC, animated: true)
        }
    }

    extension CategorySingleItemViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.size.width) - 20, height: (UIScreen.main.bounds.size.width / 2) - 50)
        }
    }
