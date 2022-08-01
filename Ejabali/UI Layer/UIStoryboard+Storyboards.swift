//
//  UIStoryboard+Storyboards.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 31/07/22.
//

import UIKit

extension UIStoryboard {

    /// The uniform place where we state all the storyboard we have in our application

    enum Storyboard: String {
        case signIn = "Login"
        var filename: String {
            return rawValue
        }
    }

    // MARK: - Convenience Initializers

    convenience init(_ storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    // MARK: - Class Functions

    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    // MARK: - View Controller Instantiation from Generics

    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: "Login") as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.mutableOrderedSetValue(forKey: "")) ")
        }
        return viewController
    }
}

