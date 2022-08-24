//
//  AccountViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

class AccountViewController: UIViewController {
    let keys = ["My Jabali Account:", "My Settings"]
    let dataDict = ["My Jabali Account:": ["My Orders","Inbox","Pending Reviews","Invite Friends", "My Favorite", "Vouchers"], "My Settings": ["Change Password", "Address Book", "Details"]]
    @IBOutlet weak var dataTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataTableView.register(HelpTableViewCell.nib, forCellReuseIdentifier: HelpTableViewCell.identifier)
        navigationController?.navigationBar.isHidden = true
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
