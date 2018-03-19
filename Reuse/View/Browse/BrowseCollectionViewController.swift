//
//  BrowseCollectionViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BrowseItemCell"

class BrowseCollectionViewController: UICollectionViewController {
    // Constants
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let itemSpacing: CGFloat = 5
    fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)

    
    // Properties
    let searchController = UISearchController(searchResultsController: nil)
    
    // Storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.tintColor = Colors.mintColor
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Actually set based on data
        let numberOfDataItems = 20
        
        return numberOfDataItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BrowseCollectionViewCell
    
        // Configure the cell
        
        // TODO: Populate with real data
        cell.itemImage.image = Images.shoeImage
        cell.priceLabel.text = "$100"
        
        
        let rand = arc4random_uniform(2)
        
        if rand == 0 { // FREE
            cell.priceLabel.isHidden = true
            cell.freeLabel.isHidden = false
        } else {
            cell.priceLabel.isHidden = false
            cell.freeLabel.isHidden = true
        }
        
        // Customized Graphic Feature
        cell.priceLabel.layer.masksToBounds = true
        cell.priceLabel.layer.cornerRadius = 4
        cell.priceLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        cell.priceLabel.setNeedsDisplay()
        
        cell.freeLabel.layer.masksToBounds = true
        cell.freeLabel.layer.cornerRadius = 4
        cell.freeLabel.setNeedsDisplay()
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


extension BrowseCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = itemSpacing * (itemsPerRow - 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
}








