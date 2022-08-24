//
//  HelpTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 10/08/22.
//

import UIKit
import WebKit

class HelpTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    
    static let identifier = "HelpTableViewCell"
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
