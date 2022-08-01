//
//  UIViewController+Storyboardidentifiable.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 01/08/22.
//

import UIKit

extension UIViewController: StoryboardIdentifiable {
    
    func startSkeletonLoader(items: [UIView] = [], color1: UIColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0), color2: UIColor = UIColor.white) {
        for item in items {
            animateGradient(item: item, color1: color1, color2: color2)
        }
    }
    
    private func animateGradient(item: UIView, color1: UIColor, color2: UIColor) {
        let gradient = CAGradientLayer()
        let hwRatio = item.bounds.size.height / item.bounds.size.width
        gradient.colors = [color1.cgColor, color2.cgColor, color1.cgColor]
        gradient.locations = [0, -6, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: hwRatio)
        gradient.frame = item.bounds
        gradient.cornerRadius = 5
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = gradient.locations
        animation.toValue = [0, 6, 1]
        animation.duration = 1.7
        animation.repeatCount = Float.infinity
        
        gradient.add(animation, forKey: "skeletonLoader")
        item.layer.insertSublayer(gradient, above: item.layer.sublayers?.last)
        // item.layer.insertSublayer(gradient, at: 0)
    }
    
    func stopSkeletonLoader(items: [UIView] = []) {
        for item in items {
            _ = item.layer.sublayers?.popLast()
            // item.layer.removeAllAnimations()
        }
    }
    
    func presentErrorAlert(alertTitle: String, alertMessage: String, buttonTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(
            title: buttonTitle,
            style: .`default`,
            handler: {_ in   })
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func presentErrorTitleAlertWithOKButton(alertMessage: String) {
        self.presentErrorAlert(alertTitle: NSLocalizedString("Common.canx.erroralert.title", bundle: Bundle.main, value: "Error", comment: ""), alertMessage: alertMessage, buttonTitle: NSLocalizedString("Common.canx.erroralert.okButtonTitle", bundle: Bundle.main, value: "OK", comment: ""))
    }
    
    func presentCommonServiceError() {
        self.presentErrorAlert(alertTitle: NSLocalizedString("Common.canx.erroralert.title", bundle: Bundle.main, value: "Error", comment: ""), alertMessage: NSLocalizedString("Common.canx.erroralert.message", bundle: Bundle.main, value: "Please try again.", comment: ""), buttonTitle: NSLocalizedString("Common.canx.erroralert.okButtonTitle", bundle: Bundle.main, value: "OK", comment: ""))
    }
    
    func presentCommonServiceErrorWithCloseButton() {
        self.presentErrorAlert(alertTitle: NSLocalizedString("Common.canx.erroralert.title", bundle: Bundle.main, value: "Error", comment: ""), alertMessage: NSLocalizedString("Common.canx.erroralert.message", bundle: Bundle.main, value: "Please try again.", comment: ""), buttonTitle: NSLocalizedString("Common.canx.erroralert.closeButtonTitle", bundle: Bundle.main, value: "Close", comment: ""))
    }
    
    func showAlertController(title: String, message: String, controller: UIViewController, completionHandler: @escaping (_ success: Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Common.canx.erroralert.okButtonTitle", bundle: Bundle.main, value: "OK", comment: ""), style: .default) { _ in
            completionHandler(true)
        }
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
}

