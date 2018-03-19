//
//  Session.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/7/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuthUI
import FirebaseFacebookAuthUI

class Session: NSObject {
    // Singleton Object
    static let session = Session()
    
    // Properties
    static var owner: Reuse.User? {
        return Session.session.owner
    }
    
    var owner: Reuse.User?
    var userReference: DocumentReference?
    var authUI: FUIAuth?
    
    
    //---------------------------------------------+
    //             MARK: Initialization            |
    //---------------------------------------------+
    
    // Private to prevent more than one instance of Session
    private override init() {}
    
    // "Init" method; must be first method called when using a Session object
    func initWithUser(_ user: Reuse.User, reference: DocumentReference){
        self.owner = user
        self.userReference = reference
    }
    
    
    //--------------------------------------------+
    //           MARK: Authentication             |
    //--------------------------------------------+
    
    // Called when return from Firebase with user object
    static func completeLogin(_ user: FirebaseAuth.User, completion: @escaping (_ error: Error?) -> Void) -> Void {
        let userRef = Constants.db.document("users/\(user.uid)")
        
        userRef.getDocument { (snapshot: DocumentSnapshot?, error: Error?) in
            if error == nil {
                let reuseUser = Reuse.User(snapshot: snapshot!)
                
                if let reuseUser = reuseUser {
                    Session.session.initWithUser(reuseUser, reference: userRef)
                    completion(nil)
                } else {
                    let error = NSError(domain: "Failure to instantiate Reuse user object from Firestore snapshot", code: 0, userInfo: nil)
                    
                    completion(error)
                }
            } else {
                completion(error)
            }
        }
    }
    
    
    //--------------------------------------------+
    //                MARK: API                   |
    //--------------------------------------------+
    
    
    // TO BE IMPLEMENTED
}

