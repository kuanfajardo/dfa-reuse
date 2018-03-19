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
    let groups: [DocumentReference]
    let displayName: String?
    let uid: String
    
    let firestoreRef: DocumentReference?
    
    // MARK: Initialization
    init(firstName: String, lastName: String, uid: String = "", groups: [DocumentReference] = [], displayName: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.groups = groups
        self.displayName = displayName == nil ? firstName : displayName!
        self.uid = uid
        self.firestoreRef = nil
    }
    
    init?(snapshot: DocumentSnapshot) {
        let data = snapshot.data()
        
        if let data = data {
            self.firstName = data[FirebaseKeys.UserFirstName] as! String
            self.lastName = data[FirebaseKeys.UserLastName] as! String
            self.groups = data[FirebaseKeys.UserGroups] as! [DocumentReference]
            self.displayName = data[FirebaseKeys.UserDisplayName] as? String
            self.uid = snapshot.documentID
            self.firestoreRef = snapshot.reference
        } else {
            return nil
        }
    }
}
