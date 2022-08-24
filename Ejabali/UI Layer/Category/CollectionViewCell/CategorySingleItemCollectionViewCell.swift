//
//  CategorySingleItemCollectionViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class CategorySingleItemCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategorySingleItemCollectionViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var rightSubTitleLabel: UILabel!

    
    @IBOutlet weak var rightIconImageView: UIImageView!
    @IBOutlet weak var leftIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "K 900.0")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        rightSubTitleLabel.attributedText = attributeString
    }

}
