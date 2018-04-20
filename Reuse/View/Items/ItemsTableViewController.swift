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
            tableView.reloadData()
        }
    }
    
    // TODO: Replace with real data
    var demoData: [[[DemoItem]]] = [
        [DemoItem.getDemoItems(forSegment: .buying, forSection: 0), DemoItem.getDemoItems(forSegment: .buying, forSection: 1)],
        [DemoItem.getDemoItems(forSegment: .selling, forSection: 0), DemoItem.getDemoItems(forSegment: .selling, forSection: 1)],
        [DemoItem.getDemoItems(forSegment: .following, forSection: 0)],
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
        return (demoData[selectedSegment.rawValue][section]).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let demoItem = demoData[selectedSegment.rawValue][indexPath.section][indexPath.row]
        
        switch selectedSegment {
        case .buying:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.buyingItemCell, for: indexPath) as! BuyingItemTableViewCell
            
            cell.titleLabel.text = demoItem.name
            cell.priceLabel.text = demoItem.priceString
            cell.conditionLabel.text = demoItem.condition.rawValue
            cell.locationLabel.text = demoItem.locationString
            cell.itemImageView.image = demoItem.image
            
            return cell
            
        case .selling:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.sellingItemCell, for: indexPath) as! SellingItemTableViewCell
            
            cell.titleLabel.text = demoItem.name
            cell.priceLabel.text = demoItem.priceString
            cell.followersLabel.text = demoItem.followersString
            cell.itemImageView.image = demoItem.image
            
            return cell
            
        case .following:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.followingItemCell, for: indexPath) as! FollowingItemTableViewCell
            
            cell.titleLabel.text = demoItem.name
            cell.priceLabel.text = demoItem.priceString
            cell.conditionLabel.text = demoItem.condition.rawValue
            cell.locationLabel.text = demoItem.locationString
            cell.itemImageView.image = demoItem.image
            
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

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.itemDetailSegue {
            let controller = segue.destination as! ItemDetailViewController
            
            let indexPath: IndexPath?
            switch selectedSegment {
            case .buying:
                let cell = sender as! BuyingItemTableViewCell
                indexPath = tableView?.indexPath(for: cell)
            case .selling:
                let cell = sender as! SellingItemTableViewCell
                indexPath = tableView?.indexPath(for: cell)
            case .following:
                let cell = sender as! FollowingItemTableViewCell
                indexPath = tableView?.indexPath(for: cell)
            }
            
            let section = (indexPath?.section)!
            let row = (indexPath?.row)!
            
            controller.item = demoData[selectedSegment.rawValue][section][row]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
}
