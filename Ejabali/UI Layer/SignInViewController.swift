//
//  SignInViewController.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 31/07/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    var setSignUp = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignInViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "GoogleSigninTableViewCell", for: indexPath)
            return signInCell
        case 1:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "OrTableViewCell", for: indexPath)
            return signInCell
        case 2:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "SignupTableViewCell", for: indexPath) as! LoginTableViewCell
            signInCell.loginTypesDelegate = self
            return signInCell
        case 3:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "LogInTableViewCell", for: indexPath) as! LoginTableViewCell
            signInCell.loginTypesDelegate = self
            return signInCell
        case 4:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "TermsTableViewCell", for: indexPath)
            return signInCell
        case 5:
            let signInCell = tableView.dequeueReusableCell(withIdentifier: "SkipTableViewCell", for: indexPath) as! LoginTableViewCell
            signInCell.loginTypesDelegate = self
            return signInCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SignUpViewController
        destinationVC?.isSignIn = setSignUp
    }

}
extension SignInViewController: LoginTypes {
    func skipLogin(number: String) {
        performSegue(withIdentifier: "moveToNext", sender: self)
    }
    
    func signUp() {
        self.setSignUp = true
        performSegue(withIdentifier: "moveToSignUp", sender: self)
    }
    
    func logIn() {
        self.setSignUp = false
        performSegue(withIdentifier: "moveToSignUp", sender: self)
    }
    
    func forgetPassword() {
        
    }
}
