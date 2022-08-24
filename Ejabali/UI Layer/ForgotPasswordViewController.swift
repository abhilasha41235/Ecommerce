//
//  ForgotPasswordViewController.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 05/08/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        var image = UIImage(named: "Back.png")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(moveToRoot))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
