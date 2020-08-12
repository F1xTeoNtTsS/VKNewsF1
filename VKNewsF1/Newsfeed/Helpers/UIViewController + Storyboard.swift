//
//  UIViewController + Storyboard.swift
//  VKNewsF1
//
//  Created by Dmitrii Abanin on 8/12/20.
//  Copyright © 2020 F1xTeoNtTsS. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
    
}
