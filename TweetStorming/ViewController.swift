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

    @IBOutlet var landingView: UIView!
    @IBOutlet weak var tweetButtonView: UIView!

    var logInButton: TWTRLogInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(colorLiteralRed: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        /*let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(colorLiteralRed: 52/255, green: 73/255, blue: 94/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradient, at: 0)*/

        // Do any additional setup after loading the view, typically from a nib.
        logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                print("signed in as \(unwrappedSession.userName)");
                self.didLoginWithTwitter(username: unwrappedSession.userName)
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }

        logInButton.layer.cornerRadius = 5
        logInButton.layer.borderWidth = 1
        //logInButton.center = tweetButtonView.center
        tweetButtonView.addSubview(logInButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logInButton?.frame = tweetButtonView.bounds
    }

    private func didLoginWithTwitter(username: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetVC = storyboard.instantiateViewController(withIdentifier: "TweetNavigationController") as! UINavigationController
        //tweetVC.username = username
        present(tweetVC, animated: true, completion: nil)
    }
}

