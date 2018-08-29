//
//  SettingsManager.swift
//  LifetimeTracker
//
//  Created by Thanh Duc Do on 23.08.18.
//  Copyright © 2018 LifetimeTracker. All rights reserved.
//

import UIKit

struct SettingsManager {

	static func showSettingsActionSheet(on viewController: UIViewController, completionHandler: @escaping (HideOption) -> Void) {
        let alert = UIAlertController(title: "settings".lt_localized, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "settings.option.hide".lt_localized, style: .default, handler: { (action: UIAlertAction) in
            let alert = UIAlertController(title: "settings.option.hide".lt_localized, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "settings.option.hide.untilMoreIssue".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.untilMoreIssue)
            }))
            alert.addAction(UIAlertAction(title: "settings.option.hide.untilNewType".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.untilNewIssueType)
            }))
            alert.addAction(UIAlertAction(title: "settings.option.hide.always".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                completionHandler(.always)
            }))
            alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: { (action: UIAlertAction) in
                completionHandler(.none)
            }))
            viewController.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: { (action: UIAlertAction) in
            completionHandler(.none)
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
