//
//  ItemDetailCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class ItemDetailCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLeftLabel: UILabel!
    @IBOutlet weak var priceRightLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    
    static let identifier = "ItemDetailCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "K 900.0")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        priceLeftLabel.attributedText = attributeString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
