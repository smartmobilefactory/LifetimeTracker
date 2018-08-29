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

        func newIssueDetected(oldModel: BarDashboardViewModel, newModel: BarDashboardViewModel) -> Bool {
            switch self {
            case .untilNewIssue:
                if oldModel.leaksCount < newModel.leaksCount {
                    return true
                }
                return false
            case .untilNewIssueKind:
                var oldGroupModelTitleSet =  Set<String>()
                for oldGroupModel in oldModel.sections {
                    oldGroupModelTitleSet.insert(oldGroupModel.groupName)
                }

                for newGroupModel in newModel.sections {
                    if !oldGroupModelTitleSet.contains(newGroupModel.groupName) && newGroupModel.entries.count > newGroupModel.entries.capacity {
                        return true
                    } else if let oldGroupModel = oldModel.sections.first(where: { (groupModel: GroupModel) -> Bool in
                        groupModel.groupName == newGroupModel.groupName
                    }) {
                        if oldGroupModel.groupCount<=oldGroupModel.groupMaxCount && newGroupModel.groupCount>newGroupModel.groupMaxCount {
                            return true
                        }
                    }
                }
                return false
            default:
                return false
            }

        }
    }
}
