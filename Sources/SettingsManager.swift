//
//  SettingsManager.swift
//  LifetimeTracker
//
//  Created by Thanh Duc Do on 23.08.18.
//  Copyright © 2018 LifetimeTracker. All rights reserved.
//

import UIKit

struct SettingsManager {

	static func showSettingsActionSheet(on viewController: UIViewController, completionHandler: @escaping (UIViewController.HideOption?) -> Void) {
        let alert = UIAlertController(title: "settings".lt_localized, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "settings.option.hide".lt_localized, style: .default, handler: { (action: UIAlertAction) in
            let alert = UIAlertController(title: "settings.option.hide".lt_localized, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "settings.option.hide.untilNewIssue".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.untilNewIssue)
            }))
            alert.addAction(UIAlertAction(title: "settings.option.hide.untilNewKind".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.untilNewIssueKind)
            }))
            alert.addAction(UIAlertAction(title: "settings.option.hide.always".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.always)
            }))
            alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: { (action: UIAlertAction) in
                completionHandler(nil)
            }))
            viewController.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: { (action: UIAlertAction) in
            completionHandler(nil)
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
