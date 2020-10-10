//
//  tweetcell.swift
//  Twitter
//
//  Created by Jolie Ip Ying See on 09/10/2020.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class tweetcell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var bodyText: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    }

