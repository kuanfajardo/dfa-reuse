//
//  ItemsTableViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

private let reuseIdentifiers = [ReuseIdentifiers.buyingItemCell, ReuseIdentifiers.sellingItemCell, ReuseIdentifiers.followingItemCell]

enum ItemSegment: Int {
    case buying = 0
    case selling = 1
    case following = 2
}

class ItemsTableViewController: UITableViewController {
    
    // MARK: Properties
    var selectedSegment: ItemSegment = ItemSegment.buying {
        didSet {
            print(selectedSegment)
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
        switch selectedSegment {
        case .following:
            return 1
        default:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedSegment {
        case .following:
            return data[2].count
        default:
            return (data[selectedSegment.rawValue][section] as! [Int]).count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedSegment {
        case .buying:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.buyingItemCell, for: indexPath) as! BuyingItemTableViewCell
            
            return cell
            
        case .selling:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.sellingItemCell, for: indexPath) as! SellingItemTableViewCell
            
            return cell
            
        case .following:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.followingItemCell, for: indexPath) as! FollowingItemTableViewCell
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch selectedSegment {
        case .buying:
            return section == 0 ? "Buying" : "Bought"
        case .selling:
            return section == 0 ? "Selling" : "Sold"
        case .following:
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
