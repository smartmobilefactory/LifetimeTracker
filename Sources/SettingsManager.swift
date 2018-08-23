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
        alert.addAction(UIAlertAction(title: "Hide options", style: .default, handler: { (action: UIAlertAction) in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Hide until new issues are detected", style: .default, handler: { (action: UIAlertAction) in
                hideUntilNewIssuesHandler()
            }))
            alert.addAction(UIAlertAction(title: "Hide always", style: .default, handler: { (action: UIAlertAction) in
                hideAlwaysHandler()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            viewController?.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
