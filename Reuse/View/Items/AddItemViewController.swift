//
//  AddItemViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/20/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit
import Eureka
import ViewRow

class AddItemViewController: FormViewController {
    
    var selectedImage: UIImage? = #imageLiteral(resourceName: "chair-1")
    
    var imageViewRow = ViewRow<UIImageView>() { row in
    }
    .cellSetup { (cell, row) in
        //  Construct the view for the cell
        cell.view = UIImageView(frame:CGRect(x: 0, y: 0, width: 100, height: 300))
        
        //  Get something to display
        cell.view!.image = #imageLiteral(resourceName: "chair-1")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set "Cancel" and "Done" button target
        let cancelBarButtonItem = self.navigationItem.leftBarButtonItem
        cancelBarButtonItem?.target = self
        cancelBarButtonItem?.action = #selector(cancelButtonPressed)
        
        let doneBarButtonItem = self.navigationItem.rightBarButtonItem
        doneBarButtonItem?.target = self
        doneBarButtonItem?.action = #selector(doneButtonPressed)
        
        // Form presets
        SliderRow.defaultCellUpdate = { cell, row in cell.slider.tintColor = Colors.mintColor }
        CheckRow.defaultCellUpdate = { cell, row in cell.tintColor = Colors.mintColor }
        
        // Make Form
        form
            
            // Sorting
            +++ Section("Item Information")
            
            <<< TextRow() { row in
                row.title = "Item Tite"
                row.placeholder = "Chair"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }.cellUpdate({ (cell, row) in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            })
            
            <<< PushRow<String>() { row in
                row.title = "Condition"
                row.options = ["New", "Like New", "Good", "Used", "Shit"]
                row.value = "New"
                row.selectorTitle = "Condition"
                row.add(rule: RuleRequired())
            }.onPresent { (from: FormViewController, to: SelectorViewController<SelectorRow<PushSelectorCell<String>>>) in
                to.selectableRowCellSetup = { cell, row in cell.tintColor = Colors.mintColor }
            }
            
            <<< IntRow() { row in
                row.title = "Price"
                row.placeholder = "$10"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
            }
        
            +++ Section("Item Description")
            
            <<< TextAreaRow() { row in
                row.title = "Description"
                row.placeholder = "A good ol' chair."
            }
        
            +++ Section("Item Image")
        
            <<< ImageRow() { row in
                row.title = "Choose an Image"
            }
            .cellUpdate({ (cell, row) in
                self.selectedImage = row.value
                self.imageViewRow.view?.image = self.selectedImage
            })

            <<< imageViewRow
    }
    
    @objc func cancelButtonPressed() {
        self.navigationController?.presentationController?.presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonPressed() {
        self.navigationController?.presentationController?.presentingViewController.dismiss(animated: true, completion: nil)
    }
}
