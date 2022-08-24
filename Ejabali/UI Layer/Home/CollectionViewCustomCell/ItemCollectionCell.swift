//
//  ItemCollectionCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    static let identifier = "ItemCollectionCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpShadow()
    }
    
    func setUpShadow() {
        baseView.dropShadow()
    }
}

