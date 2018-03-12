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
