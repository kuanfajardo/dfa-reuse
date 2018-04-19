//
//  Constants.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/7/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

struct Constants {
    static var db = Firestore.firestore()
    static var st = Storage.storage()
}

struct FirebaseKeys {
    static let UserFirstName = "first_name"
    static let UserLastName = "last_name"
    static let UserDisplayName = "display_name"
    static let UserGroups = "groups"
}

struct VCNames {
    static let tabController = "TabController"
}


struct Images {
    static let shoeImage = UIImage(named: "shoe")
}

struct Colors {
    static let mintColor = UIColor(named: "MintColor")!
    static let disabledColor = UIColor(named: "GrayColor")!
}

struct Segues {
    static let filterSegue = "ShowFilterMenu"
    static let tabControllerSegue = "ShowTabController"
    static let itemsTVCSegue = "EmbedItemsTVC"
}

struct ReuseIdentifiers {
    static let messageCell = "MessageCell"
    static let browseCell = "BrowseItemCell"
    static let buyingItemCell = "BuyingItemCell"
    static let sellingItemCell = "SellingItemCell"
    static let followingItemCell = "FollowingItemCell"
}

enum ItemCondition: String {
    case new = "New"
    case likeNew = "Like New"
    case good = "Good"
    case used = "Used"
    case shit = "Shit"
}
