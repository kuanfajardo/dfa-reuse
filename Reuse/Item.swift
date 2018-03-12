//
//  Item.swift
//  Reuse
//
//  Created by Kimberly Yu on 3/10/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit
import os.log

class Item: NSObject, NSCoding {
    
    //MARK: Properties
    
    var title: String
    var location: String
    var targetGroup: String
    var condition: String
    var price: Float
    var tags: Array<String> = []
    var itemDescription: String
    var photos: Array<UIImage> = []
    var seller: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("items")
    
    //MARK: Types
    
    struct PropertyKey {
        static let title = "title"
        static let location = "location"
        static let targetGroup = "targetGroup"
        static let condition = "condition"
        static let price = "price"
        static let tags = "tags"
        static let itemDescription = "itemDescription"
        static let photos = "photos"
        static let seller = "seller"
    }
    
    //MARK: Initialization
    
    init?(title: String, location: String, targetGroup: String, condition: String, price: Float, tags: Array<String> = [], itemDescription: String, photos: Array<UIImage> = [], seller: String) {
        
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
        
        // Initialize stored properties.
        self.title = title
        self.location = location
        self.targetGroup = targetGroup
        self.condition = condition
        self.price = price
        self.tags = tags
        self.itemDescription = itemDescription
        self.photos = photos
        self.seller = seller
    
    }
    
    //MARK: Private Methods
    
    private func editTitle(newTitle: String) {
        self.title = newTitle
    }
    
    private func editLocation(newLocation: String) {
        self.location = newLocation
    }
    
    private func editTargetGroup(newTargetGroup: String) {
        self.targetGroup = newTargetGroup
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(location, forKey: PropertyKey.location)
        aCoder.encode(targetGroup, forKey: PropertyKey.targetGroup)
        aCoder.encode(condition, forKey: PropertyKey.condition)
        aCoder.encode(price, forKey: PropertyKey.price)
        aCoder.encode(tags, forKey: PropertyKey.tags)
        aCoder.encode(itemDescription, forKey: PropertyKey.itemDescription)
        aCoder.encode(photos, forKey: PropertyKey.photos)
        aCoder.encode(seller, forKey: PropertyKey.seller)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The title is required. If we cannot decode a title string, the initializer should fail.
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String else {
            os_log("Unable to decode the title for an Item object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because location is an optional property of Item, just use conditional cast.
        let location = aDecoder.decodeObject(forKey: PropertyKey.location) as? String
        
        // Because targetGroup is an optional property of Item, just use conditional cast.
        let targetGroup = aDecoder.decodeObject(forKey: PropertyKey.targetGroup) as? String
        
        // Because condition is an optional property of Item, just use conditional cast.
        let condition = aDecoder.decodeObject(forKey: PropertyKey.condition) as? String
        
        let price = aDecoder.decodeFloat(forKey: PropertyKey.price)
        
        // Because tags is an optional property of Item, just use conditional cast.
        let tags = aDecoder.decodeObject(forKey: PropertyKey.tags) as? [String]
        
        // Because itemDescription is an optional property of Item, just use conditional cast.
        let itemDescription = aDecoder.decodeObject(forKey: PropertyKey.itemDescription) as? String
        
        // Because photos is an optional property of Item, just use conditional cast.
        let photos = aDecoder.decodeObject(forKey: PropertyKey.photos) as? [UIImage]
        
        guard let seller = aDecoder.decodeObject(forKey: PropertyKey.seller) as? String else {
            os_log("Unable to decode the seller for an Item object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(title: title, location: location!, targetGroup: targetGroup!, condition: condition!, price: price, tags: tags!, itemDescription: itemDescription!, photos: photos!, seller: seller)
    }
}
