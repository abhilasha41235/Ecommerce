//
//  HelpViewController+Datasource.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 10/08/22.
//

import UIKit

extension HelpViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.identifier, for: indexPath) as? HelpTableViewCell ?? HelpTableViewCell()
        cell.titleLable.text = dataArray[indexPath.row]
        if let url = URL(string: "https://www.google.co.in/") {
            cell.webView.load(URLRequest(url: url))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCell?.indexPath == indexPath && selectedCell?.isExpanded == true {
            return 500
        } else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCell?.isExpanded == false && selectedCell?.indexPath != indexPath {
            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: true)
        } else if selectedCell?.isExpanded == true && selectedCell?.indexPath == indexPath {
            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: false)
        } else {
            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: true)
        }
        tableView.beginUpdates()
        tableView.endUpdates()

        //tableView.reloadData()
    }
}
