//
//  FilterFormViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/5/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit
import Eureka

class FilterFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Filter"
        
        SliderRow.defaultCellUpdate = { cell, row in cell.slider.tintColor = Colors.mintColor }
        CheckRow.defaultCellUpdate = { cell, row in cell.tintColor = Colors.mintColor }
        
        // Make form
        form
        
        // Sorting
        +++ Section("Sorting")
            <<< PushRow<String>() {
                $0.title = "Sort By"
                $0.options = ["Most Recent", "Price Low to High", "Price High to Low"]
                $0.value = "Most Recent"
                $0.selectorTitle = "Sort By"
            }.onPresent { (from: FormViewController, to: SelectorViewController<SelectorRow<PushSelectorCell<String>>>) in
                    to.selectableRowCellSetup = { cell, row in cell.tintColor = Colors.mintColor }
            }
        
        // Filtering
        +++ Section("Filter By")
            // Categories
            <<< PushRow<String>() { row in
                row.title = "Categories"
                row.options = ["All Categories", "Home and Living", "School Supplies", "Appliances", "Kitchen", "Clothes"]
                row.value = "All Categories"
                row.selectorTitle = "Categories"
            }.onPresent { (from: FormViewController, to: SelectorViewController<SelectorRow<PushSelectorCell<String>>>) in
                    to.selectableRowCellSetup = { cell, row in cell.tintColor = Colors.mintColor }
            }
            
            // Condition
            <<< PushRow<String>() { row in
                row.title = "Condition"
                row.options = ["Any Condition", "New", "Like New", "Good", "Used", "Shit"]
                row.value = "Any Condition"
                row.selectorTitle = "Condition"
                }.onPresent { (from: FormViewController, to: SelectorViewController<SelectorRow<PushSelectorCell<String>>>) in
                    to.selectableRowCellSetup = { cell, row in cell.tintColor = Colors.mintColor }
                }
        
            // Price
            // TODO : Add range slider
            <<< SliderRow() {
                $0.title = "Price"
                $0.value = 5.0
            }
        
            // Location
            <<< SliderRow() { row in
                row.title = "Distance (smoots)"
                row.value = 120
                row.maximumValue = 1500
                row.steps = 300
            }
    }
}