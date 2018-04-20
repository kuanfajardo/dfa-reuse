//
//  DemoItem.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/19/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class DemoItem {
    
    // Properties
    let name: String
    let price: Int
    let location: Double
    let followers: UInt32 = arc4random_uniform(14)
    let image: UIImage
    let condition: ItemCondition
    let description: String
    
    var isFree: Bool {
        return price == 0
    }
    
    var priceString: String {
        return isFree ? "FREE" : "$\(price)"
    }
    
    var locationString: String {
        return "\(location) mi"
    }
    
    var followersString: String {
        return "\(followers) following"
    }
    
    // Data
    static let demoData: [[String : Any]] = [
        [
            "name": "Futon 1",
            "price": 130,
            "location": 0.5,
            "condition": ItemCondition.likeNew,
            "image": #imageLiteral(resourceName: "futon-1"),
            "description" : "Simple, soft, brown futon. Only used for 2 months. Pickup required."
        ],
        [
            "name": "Futon 2",
            "price": 80,
            "location": 0.5,
            "condition": ItemCondition.used,
            "image": #imageLiteral(resourceName: "futon-2"),
            "description" : "Simple, soft, brown futon. Used for 1 year. Cushions included :)"
        ],
        [
            "name": "Bunk Futon",
            "price": 80,
            "location": 0.2,
            "condition": ItemCondition.used,
            "image": #imageLiteral(resourceName: "bunk futon"),
            "description" : "Great for expanding room - sleep up top and have lounge below."
        ],
        [
            "name": "Lamp 1",
            "price": 20,
            "location": 0.5,
            "condition": ItemCondition.new,
            "image": #imageLiteral(resourceName: "lamp-1"),
            "description" : "Won it in a raffle. Can deliver."
        ],
        [
            "name": "Lamp 2",
            "price": 0,
            "location": 0.5,
            "condition": ItemCondition.shit,
            "image": #imageLiteral(resourceName: "lamp-2"),
            "description" : "Just need to get rid of it. Needs a new cable"
        ],
        [
            "name": "Chair 2",
            "price": 39,
            "location": 0.4,
            "condition": ItemCondition.good,
            "image": #imageLiteral(resourceName: "chair-2"),
            "description" : "Leather worn out on left side; other than that, real comfy"
        ],
        [
            "name": "Charger",
            "price": 55,
            "location": 0.1,
            "condition": ItemCondition.good,
            "image": #imageLiteral(resourceName: "charger"),
            "description" : "MagSafe 2, not frayed, plug a little loose"
        ],
        [
            "name": "Monitor",
            "price": 0,
            "location": 0.5,
            "condition": ItemCondition.likeNew,
            "image": #imageLiteral(resourceName: "monitor"),
            "description" : "TOSHIBA SE-34R; Used once for a conference."
        ],
        [
            "name": "TV",
            "price": 400,
            "location": 0.8,
            "condition": ItemCondition.likeNew,
            "image": #imageLiteral(resourceName: "tv"),
            "description" : "LG 4K 53 inch Smart TV"
        ],
        [
            "name": "Cleats",
            "price": 24,
            "location": 0.5,
            "condition": ItemCondition.used,
            "image": #imageLiteral(resourceName: "cleats"),
            "description" : ""
        ],
        [
            "name": "Coffee Press",
            "price": 5,
            "location": 0.25,
            "condition": ItemCondition.new,
            "image": #imageLiteral(resourceName: "coffee press"),
            "description" : "Never used."
        ],
        [
            "name": "Shoe",
            "price": 100,
            "location": 0.1,
            "condition": ItemCondition.new,
            "image": #imageLiteral(resourceName: "shoe"),
            "description" : "Adidas Say Boyz"
        ],
        [
            "name": "Chair 1",
            "price": 20,
            "location": 0.6,
            "condition": ItemCondition.good,
            "image": #imageLiteral(resourceName: "chair-1"),
            "description" : "IKEA skolrgun; legs scratched."
        ]
    ]
    
    
    init(name: String, price: Int, location: Double, condition: ItemCondition, image: UIImage, description: String) {
        self.name = name
        self.price = price
        self.location = location
        self.condition = condition
        self.image = image
        self.description = description
    }
    
    init(data: [String : Any]) {
        self.name = data["name"] as! String
        self.price = data["price"] as! Int
        self.location = data["location"] as! Double
        self.condition = data["condition"] as! ItemCondition
        self.image = data["image"] as! UIImage
        self.description = data["description"] as! String
    }
    
    
    static func getAllDemoItems() -> [DemoItem] {
        var demoItems: [DemoItem] = []
        
        for item in demoData {
            let demoItem = DemoItem(data: item)
            demoItems.append(demoItem)
        }
        
        return demoItems
    }
    
    
    static func getDemoItems(forSegment segment: ItemSegment, forSection section: Int) -> [DemoItem] {
        let tempItems = getAllDemoItems()
        var indices: [Int]
        
        switch segment {
        case .buying:
            indices = section == 0 ? [2, 3] : [4, 6, 12]
        case .selling:
            indices = section == 0 ? [0, 1] : [4, 5, 7, 11, 12]
        case .following:
            indices = [0, 1, 8, 9, 10]
        }
        
        var demoItems: [DemoItem] = []
        for i in indices {
            demoItems.append(tempItems[i])
        }
        
        return demoItems
    }
}
