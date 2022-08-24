//
//  HelpViewController.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 04/08/22.
//

import UIKit

struct SelectedCell {
    var indexPath: IndexPath
    var isExpanded: Bool
}

class HelpViewController: UIViewController {
    @IBOutlet weak var dataTableView: UITableView!
    @IBOutlet weak var searchTextFields: UITextField!

    var selectedCell: SelectedCell?
    
    let dataArray = ["HOW TO PLACE YOUR ORDER", "DELIVERY OPTIONS AND TIMELINE", "EJABALI RETURN POLICY", "CORPORATE PROCURAMENT", "CONTACT US"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.register(HelpTableViewCell.nib, forCellReuseIdentifier: HelpTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension HelpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
