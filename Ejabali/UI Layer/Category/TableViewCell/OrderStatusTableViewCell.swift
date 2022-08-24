//
//  OrderStatusTableViewCell.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 16/08/22.
//

import UIKit

class OrderStatusTableViewCell: UITableViewCell {
    static let identifier = "OrderStatusTableViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var orderSummaryButton: UIButton!
    @IBOutlet weak var paymentButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }

    func setUpUI() {
        paymentButton.layer.cornerRadius = 15.0
        paymentButton.layer.masksToBounds = true
        paymentButton.layer.borderWidth = 2.0
        paymentButton.layer.borderColor = UIColor(red: 58/255, green: 0/255, blue: 90/255, alpha: 1.0).cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
