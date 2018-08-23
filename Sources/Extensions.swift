//
//  Extensions.swift
//  LifetimeTracker
//
//  Created by Hans Seiffert on 23.10.17.
//  Copyright © 2017 LifetimeTracker. All rights reserved.
//

import Foundation
import UIKit

internal extension String {

    var lt_localized: String {
        guard let path = Bundle(for: LifetimeTracker.self).path(forResource: "LifetimeTracker", ofType: "bundle"), let bundle = Bundle(path: path) else {
            return self
        }
        return NSLocalizedString(self, bundle: bundle, comment: self)
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
