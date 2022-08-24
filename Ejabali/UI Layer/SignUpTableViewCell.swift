//
//  SignUpTableViewCell.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 04/08/22.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {
    @IBOutlet weak var signUpImage: UIImageView!
    @IBOutlet weak var signUpTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
