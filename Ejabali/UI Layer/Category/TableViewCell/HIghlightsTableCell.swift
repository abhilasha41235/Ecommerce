//
//  HIghlightsTableCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class HIghlightsTableCell: UITableViewCell {

    static let identifier = "HIghlightsTableCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
