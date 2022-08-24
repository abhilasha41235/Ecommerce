//
//  Spinner.swift
//  E-Commerce
//
//  Created by Hemant Bhatt on 08/08/22.
//

import Foundation
import UIKit

class LoadingIndicator: UIView {

  /// ActivityIndicator
  let loader = UIActivityIndicatorView()
    let windowFrame = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)


  /// Shared Instance
  static let shared: LoadingIndicator = {
    let instance = LoadingIndicator()
    return instance
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    prepared()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Design Indicator and Adding subView to Window
  func prepared() {

    self.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    self.frame = windowFrame

    loader.frame = windowFrame
    loader.style = UIActivityIndicatorView.Style.large
    loader.center = self.center
    loader.color = UIColor.gray
    self.addSubview(loader)

  }

  /// Show Indicator View with animation
  func show() {
    _ = UIApplication.shared.delegate as! AppDelegate
    // application.window?.rootViewController?.view.addSubview(self)

    UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(self)//.addSubview(self)

    loader.startAnimating()

    loader.bringSubviewToFront((UIApplication.shared.keyWindow?.rootViewController?.view)!)
    // UIApplication.shared.beginIgnoringInteractionEvents()
  }

  /// Hide Indicator View with animation
  func hide() {
    self.removeFromSuperview()
    loader.stopAnimating()

    // if UIApplication.shared.isIgnoringInteractionEvents {
    // UIApplication.shared.endIgnoringInteractionEvents()
    // }
  }

}
