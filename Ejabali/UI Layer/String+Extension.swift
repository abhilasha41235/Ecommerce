//
//  String+Extension.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 11/08/22.
//
import UIKit

extension String {
    
    func getWidthOfString(font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return size
    }
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
