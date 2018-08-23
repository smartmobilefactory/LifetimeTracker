//
//  SettingsManager.swift
//  LifetimeTracker
//
//  Created by Thanh Duc Do on 23.08.18.
//  Copyright © 2018 LifetimeTracker. All rights reserved.
//

import UIKit

struct SettingsManager {

    static func showSettingsActionSheet(on viewController: UIViewController?, hideUntilNewIssuesHandler: @escaping () -> (), hideAlwaysHandler: @escaping () -> ()) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "settings.option.hide".lt_localized, style: .default, handler: { (action: UIAlertAction) in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "settings.option.hide.untilNew".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                hideUntilNewIssuesHandler()
            }))
            alert.addAction(UIAlertAction(title: "settings.option.hide.always".lt_localized, style: .default, handler: { (action: UIAlertAction) in
                hideAlwaysHandler()
            }))
            alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: nil))
            viewController?.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "settings.cancel".lt_localized, style: .cancel, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
