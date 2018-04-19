//
//  ItemsViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var tableViewController: ItemsTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: Actions
    @IBAction func action(sender: UIControl, forEvent event: UIEvent) {
        if let _ = sender as? UISegmentedControl {
            self.tableViewController?.selectedSegment = ItemSegment(rawValue: segmentedControl.selectedSegmentIndex)!
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.itemsTVCSegue {
            self.tableViewController = segue.destination as? ItemsTableViewController
        }
    }
}
