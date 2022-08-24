//
//  TopHorizontalTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit
import Kingfisher

class TopHorizontalTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var categoryTop: [MainCategory]?

    static let identifier = "TopHorizontalTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCell() {
        collectionView.register(TopHozizontalCollectionViewCell.nib, forCellWithReuseIdentifier: TopHozizontalCollectionViewCell.identifier)
    }
}

extension TopHorizontalTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTop?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHozizontalCollectionViewCell.identifier, for: indexPath) as? TopHozizontalCollectionViewCell ?? TopHozizontalCollectionViewCell()
        let url = URL(string: categoryTop?[indexPath.row].img ?? "")
        cell.imageView.kf.setImage(with: url)
        cell.titleLabel.text = categoryTop?[indexPath.row].cat_name?.capitalizingFirstLetter()
        if categoryTop?[indexPath.row].widthOfTitle ?? 0.0 < 54 {
            cell.topConstraint.constant = 18
            cell.imageHtConstraint.constant = 40 - 5
            cell.imageWidthConstraint.constant = 40 - 5
            cell.imageView.layer.cornerRadius = 17.5
        } else {
            cell.topConstraint.constant = 10
            cell.imageHtConstraint.constant = 40 + 10
            cell.imageWidthConstraint.constant = 40 + 10
            cell.imageView.layer.cornerRadius = 25
        }
        cell.imageView.layer.masksToBounds = true
        return cell
    }
}

extension TopHorizontalTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if categoryTop?[indexPath.row].widthOfTitle ?? 0.0 < 34 {
            return CGSize(width: 34, height: 90)
        } else {
            return CGSize(width: (categoryTop?[indexPath.row].widthOfTitle  ?? 0.0), height: 90)
        }
    }
}
