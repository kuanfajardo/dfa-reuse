//
//  MessagesTableViewCell.swift
//  Reuse
//
//  Created by Juan Diego Fajardo on 3/16/18.
//  Copyright © 2018 Design for America - MIT. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unreadView: UIView!
    
    var messengerID: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contactImageView.layer.masksToBounds = true
        self.contactImageView.contentMode = .scaleAspectFill
        self.contactImageView.layer.cornerRadius = self.contactImageView.frame.width / 2
        
        self.unreadView.layer.masksToBounds = true
        self.unreadView.layer.cornerRadius = self.unreadView.frame.width / 2
        self.unreadView.backgroundColor = Colors.mintColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        let color = unreadView.backgroundColor
        super.setSelected(selected, animated: animated)
        
        if selected {
            unreadView.backgroundColor = color
        }
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let color = unreadView.backgroundColor
        super.setHighlighted(highlighted, animated: animated)

        if highlighted {
            unreadView.backgroundColor = color
        }
    }


}
