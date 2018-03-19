//
//  LoginViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/12/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI

class LoginViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
   
    
    // MARK: Actions
    
    @IBAction func loginButtonPressed(sender: UIButton!) {
        self.presentFirebaseAuthController()
    }
    
    
    // MARK: Helper Functions
    
    func presentFirebaseAuthController() {
        Session.session.authUI?.delegate = self
        let authViewController = Session.session.authUI!.authViewController()
        
        self.present(authViewController, animated: true) {
            self.activityIndicator.startAnimating()
            
        }
    }
}


// MARK: Authentication

// TODO: to be replaced by some Kerberos-authenticating method
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: Firebase.User?, error: Error?) {
        if (error == nil) {
            Session.completeLogin(user!, completion: { (error) in
                if error == nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: VCNames.tabController)
                    let nvc = self.navigationController
                    self.activityIndicator.stopAnimating()
                    nvc?.pushViewController(vc!, animated: true)
                } else {
                    // TODO: Handle Error
                }
            })
        } else {
            // TODO: Handle Error
        }
    }
}

