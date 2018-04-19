//
//  ItemsTableViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    // MARK: Properties
    var selectedSegmentIndex: Int = 0 {          // 0 - "Buying", 1 - "Selling", 2 - "Following"
        didSet {
            print(selectedSegmentIndex)
            tableView.reloadData()
        }
    }
    
    // TODO: Replace with real data
    var data: [[Any]] = [
        [[0, 1, 2], [0, 1]],
        [[0], [0, 1, 2, 3, 4, 5]],
        [0, 1, 2, 3, 4, 5, 6, 7]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        switch selectedSegmentIndex {
        case 2:
            return 1
        default:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedSegmentIndex {
        case 2:
            return data[2].count
        default:
            return (data[selectedSegmentIndex][section] as! [Int]).count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch selectedSegmentIndex {
        case 0:
            return section == 0 ? "Buying" : "Bought"
        case 1:
            return section == 0 ? "Selling" : "Sold"
        default:
            return "Following"
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
