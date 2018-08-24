//
//  Extensions.swift
//  LifetimeTracker
//
//  Created by Hans Seiffert on 09.11.17.
//  Copyright © 2017 LifetimeTracker. All rights reserved.
//

import UIKit

internal extension UIView {
    
    class var lt_nibInOwnBundle: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

internal extension UIApplication {
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
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

internal extension UIViewController {

    enum HideOption {
        case untilNewIssue
        case untilNewIssueKind
        case always

        internal func groupName(from title: String) -> String? {
            if let index = title.range(of: " ", options: .backwards, range: nil, locale: nil)?.lowerBound {
                return String(title[..<index])
            }

            return nil
        }
    }
}
