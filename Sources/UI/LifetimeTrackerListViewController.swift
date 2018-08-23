//
//  LifetimeTrackerListViewController.swift
//  LifetimeTracker-iOS
//
//  Created by Hans Seiffert on 18.03.18.
//  Copyright © 2018 LifetimeTracker. All rights reserved.
//

import UIKit

protocol PopoverViewControllerDelegate: class {
    func dismissPopoverViewController()
    func hideLifetimeTracker(untilNextIssueIsDetected: Bool)
}


class LifetimeTrackerListViewController: UIViewController {
    
    weak var delegate: PopoverViewControllerDelegate?
    
    weak var tableViewController: DashboardTableViewController?
    
    var dashboardViewModel = BarDashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        delegate?.dismissPopoverViewController()
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Hide options", style: .default, handler: { (action: UIAlertAction) in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Hide until new issues are detected", style: .default, handler: { (action: UIAlertAction) in
                self.delegate?.hideLifetimeTracker(untilNextIssueIsDetected: true)
            }))
            alert.addAction(UIAlertAction(title: "Hide always", style: .default, handler: { (action: UIAlertAction) in
                self.delegate?.hideLifetimeTracker(untilNextIssueIsDetected: false)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func update(dashboardViewModel: BarDashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
        
        title = "popover.dasboard.title".lt_localized
        
        tableViewController?.update(dashboardViewModel: dashboardViewModel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.embedDashboardTableView.identifier {
            tableViewController = segue.destination as? DashboardTableViewController
            tableViewController?.update(dashboardViewModel: dashboardViewModel)
        }
    }
}
