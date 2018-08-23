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

internal extension UIViewController {

    func getTopLevelViewController() -> UIViewController {
        var topViewController = self
        while let topController = self.presentedViewController {
            topViewController = topController
        }

        return topViewController
    }
}
