//
//  PriceDetailTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 18/08/22.
//

import UIKit

class PriceDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mrpLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var itemAmountLabel: UILabel!
    @IBOutlet weak var deliveryChargeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    static let identifier = "PriceDetailTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "K 1550.0")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        mrpLabel.attributedText = attributeString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
