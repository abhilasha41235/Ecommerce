//
//  BannerCollectionViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    static let identifier = "TopHozizontalCollectionViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }

}
