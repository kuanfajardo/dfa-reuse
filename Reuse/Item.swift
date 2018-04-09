//
//  Item.swift
//  Reuse
//
//  Created by Kimberly Yu on 3/10/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit
//import FIRDatabase

class Item {
    
    //MARK: Properties
    
    //Initialize firebase database
//    let ref = FIRDatabase.database().reference(withPath: "dfa-reuse")
    
    var title: String
    var location: String
    var targetGroup: String
    var condition: String
    var price: Float
    var tags: Array<String> = []
    var description: String
    var photos: Array<UIImage> = []
    var seller: String
    var buyer: String
    var following: Int = 0
    var buyDate: Date
    var postedDate: Date = Date()
    
    //MARK: Initialization
    
    init?(title: String, location: String, targetGroup: String, condition: String, price: Float, tags: Array<String> = [], description: String, photos: Array<UIImage> = [], seller: String, buyer: String, following: Int = 0, buyDate: Date, postedDate: Date = Date()) {
        // The title must not be empty
        guard !title.isEmpty else {
            return nil
        }
        
        // The seller must not be empty
        guard !seller.isEmpty else {
            return nil
        }
        
        guard (price >= 0) else {
            return nil
        }
        
        guard (following >= 0) else {
            return nil
        }
        
        // Initialize stored properties.
        self.title = title
        self.location = location
        self.targetGroup = targetGroup
        self.condition = condition
        self.price = price
        self.tags = tags
        self.description = description
        self.photos = photos
        self.seller = seller
        self.buyer = buyer
        self.following = following
        self.buyDate = buyDate
        self.postedDate = postedDate
        
        //Records the item in each relevant section of the FireBase database
//        let itemDb = self.ref.child("items")
//        let tagsDb = self.ref.child("tags")
//        let userDb = self.ref.child("users").child(seller)
        
//        itemDb.child(title).setValue(self.toAnyObject())                //All objects
//        userDb.child(title).setValue(self.toAnyObject())                //Categorized by user
        
//        for tag in tags{
//            tagsDb.child(tag).child(title).setValue(self.toAnyObject()) //Categorized by tag
//        }
        
        
    
    }
    
    
    
}
