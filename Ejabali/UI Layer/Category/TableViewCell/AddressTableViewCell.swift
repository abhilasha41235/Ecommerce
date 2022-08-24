//
//  AddressTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 18/08/22.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    static let identifier = "AddressTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var detailedAddressLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI() {
        changeButton.layer.cornerRadius = 15
        changeButton.layer.masksToBounds = true
    }
    
}
