//
//  ItemDetailViewController.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/20/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var followingButton: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Properties
    var item: DemoItem?
    
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
    var isFollowing: Bool = false {
        didSet {
            self.followingButton.image = isFollowing ? #imageLiteral(resourceName: "bell_green") : #imageLiteral(resourceName: "bell_grey")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.itemImageView.image = item?.image
        self.titleLabel.text = item?.name
        self.priceLabel.text = item?.priceString
        self.conditionLabel.text = item?.condition.rawValue
        self.locationLabel.text = "⚲ " + item!.locationString
        self.descriptionLabel.text = item?.description
        self.isFollowing = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestToBuyPressed() {
        print("Requested to Buy")
    }
    
    @IBAction func contactSellerPressed() {
        print("Contact Seller")
    }
    
    @IBAction func followButtonPressed() {
        isFollowing = !isFollowing
    }
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) -> Void {
        let touchPoint = sender.location(in: self.view.window)
        
        switch sender.state {
        case .began:
            initialTouchPoint = touchPoint
        case .changed:
            if touchPoint.y > initialTouchPoint.y {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        case .ended:
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        default:
            break
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


