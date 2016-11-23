//
//  TweetViewController.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/3/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    var tweetTableVC: TweetTableViewController?
    @IBOutlet var tweetSizeLabel: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTableVC = self.childViewControllers.first as? TweetTableViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func postOnTwitter(_ sender: UIButton) {
        if let tweets = tweetTableVC?.tweets {
            let tweetPostingManager = TwitterPost(tweets: tweets)
            tweetPostingManager.postOnTwitter()
        }
        
    }
}
