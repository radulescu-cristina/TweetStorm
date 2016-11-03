//
//  TweetTableViewCell.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/2/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var tweetTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
