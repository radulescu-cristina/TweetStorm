//
//  TweetTableViewController.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/2/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import UIKit

let kTweetMaxLength = 12

class TweetTableViewController: UITableViewController, UITextViewDelegate {
    
    var tweets = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweets.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetTableViewCell", for: indexPath)
            as! TweetTableViewCell

        // Configure the cell...
        cell.tweetTextView.delegate = self

        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView?
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height:50))
        let button = UIButton(
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    // MARK: UITextViewDelegate protocolfew
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var tweet: String = textView.text
        if tweet.characters.count + (text.characters.count - range.length) > kTweetMaxLength {
            
            //Hide keyboard
            self.resignFirstResponder()
            
            //"\(tweets.count+1)/"
            /*let newIndexPath = IndexPath(row: tweets.count, section: 0)
            tweets.append(tweet)
            tableView.insertRows(at: [newIndexPath], with: .bottom)*/
            return false
        }
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
