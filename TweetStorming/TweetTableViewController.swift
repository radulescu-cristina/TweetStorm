//
//  TweetTableViewController.swift
//  TweetStorming
//
//  Created by Cristina Radulescu on 11/2/16.
//  Copyright © 2016 Cristina Radulescu. All rights reserved.
//

import UIKit

let kTweetMaxLength = 140

class TweetTableViewController: UITableViewController, UITextViewDelegate {
    
    var tweets = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.delegate = self
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)

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
        cell.tweetTextView.text = "\(tweets.count+1)/ "

        return cell
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
        if textView.text.characters.count + (text.characters.count - range.length) > kTweetMaxLength {
            //Hide keyboard
            self.resignFirstResponder()
            return false
        }
        return true
    }

    func textViewDidChange(_ textView: UITextView) {
        let indexPath = self.indexPathForTextView(textView: textView)
        if let currentTweetText = textView.text {
            tweets[indexPath.row] = currentTweetText
        }
    }

    private func indexPathForTextView(textView: UITextView) -> IndexPath {
        let cell = textView.superview?.superview as! TweetTableViewCell
        return self.tableView.indexPath(for: cell)!
    }


    //MARK: Actions

    @IBAction func deleteTweet(_ sender: UIButton) {
        let cell = sender.superview?.superview as! TweetTableViewCell
        if let index = tableView.indexPath(for: cell) {
            print("Delete tweet")
            tweets.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .fade)

        }
    }
    @IBAction func addTweet(_ sender: UIButton) {
        print ("Add new tweet")
        let newIndexPath = IndexPath(row: tweets.count, section: 0)
        tweets.append("")
        tableView.insertRows(at: [newIndexPath], with: .bottom)
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
