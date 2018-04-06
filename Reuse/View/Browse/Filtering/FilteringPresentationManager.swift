//
//  FilteringPresentationManager.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/6/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class FilteringPresentationManager: NSObject {

}

extension FilteringPresentationManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentationController = FilteringPresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController
    }
}
