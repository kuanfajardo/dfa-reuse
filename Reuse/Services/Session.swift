//
//  Session.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/7/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import Foundation
import Firebase

class Session {
    // Singleton Object
    static let session = Session()
    
    // Properties
    var owner: Reuse.User?
    
    static var owner: Reuse.User? {
        return Session.session.owner
    }
    
    
    //---------------------------------------------+
    //             MARK: Initialization            |
    //---------------------------------------------+
    
    // Private to prevent more than one instance of Session
    private init() {}
    
    // "Init" method; must be first method called when using a Session object
    func initWithUser(_ user: Reuse.User, inDispatch dispatch: DispatchGroup? = nil) {
        self.owner = user
    }
    
    
    //--------------------------------------------+
    //           MARK: Authentication             |
    //--------------------------------------------+
    
    // TODO: to be replaced by some Kerberos-authenticating method
    static func signIn(withEmail email: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> Void {
        Auth.auth().signIn(withEmail: email, password: password) { (user: FirebaseAuth.User?, error: Error?) in
            if (error == nil) {
                print("\n~~ Login Successful! ~~\n")
                Session.completeLogin(user!, completion: completion)
            } else {
                completion(error)
            }
        }
    }
    
    
    static func completeLogin(_ user: FirebaseAuth.User, completion: @escaping (_ error: Error?) -> Void) -> Void {
        Constants.db.document("users/\(user.uid)").getDocument { (snapshot: DocumentSnapshot?, error: Error?) in
            if error == nil {
                let reuseUser = Reuse.User(snapshot: snapshot!)
                
                if let reuseUser = reuseUser {
                    Session.session.initWithUser(reuseUser)
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
