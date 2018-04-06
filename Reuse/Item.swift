//
//  Item.swift
//  Reuse
//
//  Created by Kimberly Yu on 3/10/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class Item {
    
    //MARK: Properties
    
    var title: String
    var location: String
    var targetGroup: String
    var condition: String
    var price: Float
    var tags: Array<String> = []
    var description: String
    var photos: Array<UIImage> = []
    var seller: String
    
    //MARK: Initialization
    
    init?(title: String, location: String, targetGroup: String, condition: String, price: Float, tags: Array<String> = [], description: String, photos: Array<UIImage> = [], seller: String) {
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
        self.description = description
        self.photos = photos
        self.seller = seller
    
    }
    
}
