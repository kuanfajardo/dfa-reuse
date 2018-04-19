//
//  MessagesTableViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/16/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

private let reuseIdentifier = ReuseIdentifiers.messageCell
private let testData = [
    [
        "messengerID": "brennan.lee.thehalfasian",
        "contactName": "Brennan Lee",
        "message": "you can pickup from 8-10",
        "unread": "true",
        "time": "12:01 pm"
    ],
    [
        "messengerID": "kuanfajardo",
        "contactName": "Juan Diego Fajardo",
        "message": "Hey! Really interested in buying that car - how much?",
        "unread": "true",
        "time": "9:53 am"
    ],
    [
        "messengerID": "100004212467131",
        "contactName": "Erica Chiu",
        "message": "How does $15 sound?",
        "unread": "false",
        "time": "Tue"
    ],
    [
        "messengerID": "kristen.ngan",
        "contactName": "Kristen Ngan",
        "message": "Why is the chair \"used\"?",
        "unread": "false",
        "time": "2/14/18"
    ],
]

class MessagesTableViewController: UITableViewController {
    // Properties
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.tintColor = Colors.mintColor
        
        tableView.estimatedRowHeight = 70
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(forName: .UIApplicationDidBecomeActive, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIApplicationDidBecomeActive, object: .none)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numMessages = testData.count
        
        return numMessages
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MessagesTableViewCell
        
        // TODO: populate with real data
        // Configure the cell...
        let data = testData[indexPath.row]
        
        cell.messengerID = data["messengerID"]
        cell.contactLabel.text = data["contactName"]
        cell.messageLabel.text = data["message"]
        cell.timeLabel.text = data["time"]
        cell.contactImageView.image = UIImage(named: data["messengerID"]!)
        cell.unreadView.isHidden = data["unread"] == "true" ? false : true
        
        cell.contactLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        cell.timeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        cell.contactImageView.layer.cornerRadius = cell.contactImageView.frame.width / 2

        return cell
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


extension MessagesTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! MessagesTableViewCell
        let urlString = "http://m.me/\(cell.messengerID!)"
        
        UIApplication.shared.open(URL(string: urlString)!, options: [:], completionHandler: nil)
    }
}
