//
//  PostTableViewCell.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/15/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.backgroundColor = UIColor.clearColor()
        bgView.layer.borderColor = UIColor.blackColor().CGColor
        bgView.layer.borderWidth = 1
        bgView.layer.cornerRadius = 5
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
