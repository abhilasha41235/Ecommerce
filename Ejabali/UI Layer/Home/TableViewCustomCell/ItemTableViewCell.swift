//
//  ItemTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var mainCategoryModel: MainCategoryModel?

    static let identifier = "ItemTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        setUpUI()
    }
    
    func setUpUI() {
        viewAllButton.layer.cornerRadius = 8
        viewAllButton.layer.masksToBounds = true
    }
    
    func registerCell() {
        collectionView.register(ItemCollectionCell.nib, forCellWithReuseIdentifier: ItemCollectionCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func viewAllAction(_ sender: Any) {
        
    }
}

extension ItemTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.identifier, for: indexPath) as? ItemCollectionCell ?? ItemCollectionCell()
        let itemName = mainCategoryModel?.u?[indexPath.row].Sub_cat_name ?? ""
        cell.itemNameLabel.text = itemName.capitalizingFirstLetter()
        let url = URL(string: mainCategoryModel?.u?[indexPath.row].image1 ?? "")
        cell.imageView.kf.setImage(with: url)
        return cell
    }
}

extension ItemTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width / 2) - 20, height: (UIScreen.main.bounds.size.width / 2) + 50)
    }
}
