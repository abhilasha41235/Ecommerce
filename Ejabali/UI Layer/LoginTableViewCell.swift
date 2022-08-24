//
//  LoginTableViewCell.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 04/08/22.
//

import UIKit

protocol LoginTypes: AnyObject {
    func skipLogin(number: String)
    func signUp()
    func logIn()
    func forgetPassword()
}

class LoginTableViewCell: UITableViewCell {
    weak var loginTypesDelegate: LoginTypes?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func continueWithGoogleClicked(_ sender: UIButton) {
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        loginTypesDelegate?.signUp()
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        loginTypesDelegate?.logIn()
    }
    
    @IBAction func skipClicked(_ sender: UIButton) {
        loginTypesDelegate?.skipLogin(number: "")
    }
    
    @IBAction func forgetPasswordClicked(_ sender: UIButton) {
        loginTypesDelegate?.forgetPassword()
    }
}
