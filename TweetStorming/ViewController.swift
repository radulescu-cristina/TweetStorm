//
//  ViewController.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/1/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    @IBOutlet weak var tweetButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                print("signed in as \(unwrappedSession.userName)");
                self.didLoginWithTwitter(username: unwrappedSession.userName)
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }

        //logInButton.center = tweetButtonView.center
        tweetButtonView.addSubview(logInButton)
    }

    private func didLoginWithTwitter(username: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetVC = storyboard.instantiateViewController(withIdentifier: "TweetNavigationController") as! UINavigationController
        //tweetVC.username = username
        present(tweetVC, animated: true, completion: nil)
    }
}

