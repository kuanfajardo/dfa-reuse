//
//  User.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/11/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import Foundation
import FirebaseFirestore

class User {
    
    // MARK: Properties
    let firstName: String
    let lastName: String
    let groups: [String]
    let displayName: String
    
    // MARK: Initialization
    init(firstName: String, lastName: String, groups: [String] = [], displayName: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.groups = groups
        self.displayName = displayName == nil ? firstName : displayName!
    }
    
    init?(snapshot: DocumentSnapshot) {
        let data = snapshot.data()
        
        if let data = data {
            self.firstName = data[FirebaseKeys.UserFirstName] as! String
            self.lastName = data[FirebaseKeys.UserLastName] as! String
            self.groups = data[FirebaseKeys.UserGroups] as! [String]
            self.displayName = data[FirebaseKeys.UserDisplayName] as! String
        } else {
            return nil
        }
    }
}
