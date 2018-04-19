//
//  SellingItemTableViewCell.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 4/19/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class SellingItemTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
