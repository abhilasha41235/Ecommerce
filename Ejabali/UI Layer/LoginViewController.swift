//
//  LoginViewController.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 04/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    let placeHoldersLogin = ["like 260776667891", "like asd@123#", "Forgot Password?", "Login"]
    let placeHolderImages = ["Person.png", "Lock.png"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Signup", style: .done, target: self, action: #selector(moveToLogin))
        var image = UIImage(named: "Back.png")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(moveToRoot))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.4078431373, green: 0.2039215686, blue: 0.6039215686, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func moveToLogin() {
        let signInVC: SignUpViewController = UIStoryboard(.signIn).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([signInVC], animated: false)
        navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @objc func moveToRoot() {
        navigationController?.popToRootViewController(animated: true)
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

extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeHoldersLogin.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
            case placeHoldersLogin.count - 1:
                let signUpCell = tableView.dequeueReusableCell(withIdentifier: "signUpCell", for: indexPath)
                return signUpCell
            case placeHoldersLogin.count - 2:
                let signUpCell = tableView.dequeueReusableCell(withIdentifier: "forgotPasswordCell", for: indexPath) as! LoginTableViewCell
                signUpCell.loginTypesDelegate = self
                return signUpCell
            default:
                let signUpCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! SignUpTableViewCell
                signUpCell.signUpTF.placeholder = placeHoldersLogin[indexPath.row]
                signUpCell.signUpImage.image = UIImage(named: placeHolderImages[indexPath.row])
                return signUpCell
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

extension LoginViewController: LoginTypes {
    func skipLogin(number: String) {
       // performSegue(withIdentifier: "moveToNext", sender: self)
    }
    
    func signUp() {
        // self.setSignUp = true
        // performSegue(withIdentifier: "moveToSignUp", sender: self)
        let signInVC: SignUpViewController = UIStoryboard(.signIn).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([signInVC], animated: false)
        navigationController?.pushViewController(signInVC, animated: true)

    }
    
    func logIn() {
        // self.setSignUp = false
        let logInVC: LoginViewController = UIStoryboard(.signIn).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([logInVC], animated: false)
        navigationController?.pushViewController(logInVC, animated: true)
    }
    
    func forgetPassword() {
        // self.setSignUp = false
        let forgetPasswordVC: ForgotPasswordViewController = UIStoryboard(.signIn).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([forgetPasswordVC], animated: false)
        navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
}
