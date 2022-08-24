//
//  UIView+Extension.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 05/08/22.
//

import UIKit
extension UIView {

  func dropShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
    layer.shadowOpacity = 0.25
    layer.shadowRadius = 0.0
    layer.masksToBounds = false
    layer.cornerRadius = 4.0
  }
}
