//
//  BannerTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var banner: [BannerDetail]?

    static let identifier = "BannerTableViewCell"
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
        collectionView.register(BannerCollectionViewCell.nib, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
    }
}

extension BannerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell ?? BannerCollectionViewCell()
        let url = URL(string: banner?[indexPath.row].Banner_image ?? "")
        cell.imageView.kf.setImage(with: url)
        return cell
    }
}

extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width / 5, height: UIScreen.main.bounds.size.width / 1.9)
    }
}
