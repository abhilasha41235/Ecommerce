//
//  StoryboardIdentifiable.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 31/07/22.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
