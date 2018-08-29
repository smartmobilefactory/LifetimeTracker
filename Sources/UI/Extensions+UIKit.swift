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
