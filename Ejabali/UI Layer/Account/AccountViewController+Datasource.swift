//
//  AccountViewController+Datasource.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 12/08/22.
//

import UIKit

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section].capitalized
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let allValues = dataDict[keys[section]]
        return allValues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.identifier, for: indexPath) as? HelpTableViewCell ?? HelpTableViewCell()
        switch indexPath.section {
        case 0:
            let values = dataDict["My Jabali Account:"]
            cell.titleLable.text = values?[indexPath.row]
        default:
            let values = dataDict["My Settings"]
            cell.titleLable.text = values?[indexPath.row]
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if selectedCell?.isExpanded == false && selectedCell?.indexPath != indexPath {
//            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: true)
//        } else if selectedCell?.isExpanded == true && selectedCell?.indexPath == indexPath {
//            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: false)
//        } else {
//            selectedCell = SelectedCell(indexPath: indexPath, isExpanded: true)
//        }
//        tableView.beginUpdates()
//        tableView.endUpdates()
//
//        //tableView.reloadData()
    }
}

