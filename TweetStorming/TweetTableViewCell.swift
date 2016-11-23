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

    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateContentInsetForTextView()
        tweetTextView.textContainer.lineFragmentPadding = 20
    }

    func updateContentInsetForTextView() {
        var topCorrect = (self.bounds.size.height - tweetTextView.contentSize.height * tweetTextView.zoomScale) / 2
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect;
        tweetTextView.contentInset.top = topCorrect
    }
}
