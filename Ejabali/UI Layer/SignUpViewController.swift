//
//  SignUpViewController.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 04/08/22.
//

import UIKit

class SignUpViewController: UIViewController {
    let placeHoldersSignUp = ["like andrew", "like 260892341147", "like test@gmail.com", "like asd@123", "like asd@123", "Sign up"]
    let placeHolderImages = ["Person.png", "Phone.png", "Mail.png", "Lock.png", "Lock.png"]
    //let placeHoldersLogin = ["like 260776667891", "like asd@123#", "Forgot Password?", "Login"]
    
    @IBOutlet weak var tableView: UITableView!
    var isSignIn = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log In", style: .done, target: self, action: #selector(moveToLogin))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(moveToRoot))
        navigationItem.leftBarButtonItem?.image = UIImage(named: "Back.png")
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
        let logInVC: LoginViewController = UIStoryboard(.signIn).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([logInVC], animated: false)
        navigationController?.pushViewController(logInVC, animated: true)
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

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeHoldersSignUp.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
            case placeHoldersSignUp.count - 1:
                let signUpCell = tableView.dequeueReusableCell(withIdentifier: "signUpCell", for: indexPath)
                return signUpCell
            default:
                let signUpCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! SignUpTableViewCell
                signUpCell.signUpTF.placeholder = placeHoldersSignUp[indexPath.row]
                signUpCell.signUpImage.image = UIImage(named: placeHolderImages[indexPath.row])
                return signUpCell
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}
