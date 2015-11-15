//
//  WorkerViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/15/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class WorkerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var workers: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false

        print("I AM IN working thing!!!!")
        
        FBController.filterUsers { (arr) -> Void in
            print("This is the result \(arr)")
            self.workers = arr
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutButtonPressed(sender: UIButton) {
        FBController.logOut()
        self.performSegueWithIdentifier("workerToHomeSegue", sender: self)
    }
    
    
    // MARK: Tableview Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 5
        
        if workers != nil {
            "There are more posts"
            return workers.count
        } else {
            print("There are 0 posts")
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: WorkerTableViewCell = tableView.dequeueReusableCellWithIdentifier("workerTableViewCell") as! WorkerTableViewCell
        //cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if let results = workers {
            print(results)
            let post = results[indexPath.row]
            print("THE POST IS ABOUT TO BE")
            print(post)
            //let post = postArray.allValues as! NSDictionary
            //print(results)
            cell.workerNameLabel.text = post.valueForKey("name") as? String
            cell.descriptionTextView.text = post.valueForKey("description") as? String
            cell.occupationsLabel.text = post.valueForKey("status") as? String
        }
        
        
        return cell
    }
    
    
    // MARK: TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
