//
//  PostOnTwitter.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/3/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterPost {
    var tweets: [String]
    let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/update.json"
    
    init(tweets: [String]) {
        self.tweets = tweets
    }
    
    func getUserID() -> String? {
        let store = Twitter.sharedInstance().sessionStore
        return store.session()?.userID
    }
    
    func postOnTwitter() {
        if let userId = getUserID() {
            let client = TWTRAPIClient(userID: userId)
            for tweet in tweets {
                let params = ["status": tweet]
                var clientError : NSError?
                Thread.sleep(forTimeInterval: 5)
                
                let request = client.urlRequest(withMethod: "POST", url: statusesShowEndpoint, parameters: params, error: &clientError)
                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                    if (connectionError == nil) {
                        let json = try? JSONSerialization.jsonObject(with: data!)
                    }
                    else {
                        print("Error: \(connectionError)")
                    }
                }
            }
        }
    }
}
