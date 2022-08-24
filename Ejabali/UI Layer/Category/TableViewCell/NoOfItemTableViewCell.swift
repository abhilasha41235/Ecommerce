//
//  NoOfItemTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 18/08/22.
//

import UIKit

class NoOfItemTableViewCell: UITableViewCell {
    static let identifier = "NoOfItemTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemOldPrice: UILabel!
    @IBOutlet weak var ItemNewPrice: UILabel!
    @IBOutlet weak var itemPriceOff: UILabel!
    @IBOutlet weak var noOfItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.dropShadow()
        // Initialization code
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "K 900.0")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        itemOldPrice.attributedText = attributeString
    }
    @IBOutlet weak var decreamentButton: UIButton!
    @IBOutlet weak var increamentButton: UIButton!
    
    @IBAction func decreamentButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func increamentActionButton(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
