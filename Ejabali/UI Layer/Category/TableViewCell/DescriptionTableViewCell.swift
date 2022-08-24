//
//  DescriptionTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

protocol MoreActionProtocol {
    func moreAction()
}

class DescriptionTableViewCell: UITableViewCell {

    static let identifier = "DescriptionTableViewCell"
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
    
    @IBAction func moreAction(_ sender: Any) {
    }
}
