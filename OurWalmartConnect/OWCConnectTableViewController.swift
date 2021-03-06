//
//  OWCConnectTableViewController.swift
//  OurWalmartConnect
//
//  Created by David Phan on 1/30/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class OWCConnectTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //TableView SetuUp
        tableView.registerNib(UINib(nibName: "OWCConnectWalmartTableViewCell", bundle: nil), forCellReuseIdentifier: "connectCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ((self.parentViewController as! OWCConnectMainView).connectDataManager?.tableViewObjects.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        if (self.parentViewController as! OWCConnectMainView).connectSegmentedControl.selectedSegmentIndex == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("connectCell", forIndexPath: indexPath) as! OWCConnectWalmartTableViewCell
            let object = ((self.parentViewController as! OWCConnectMainView).connectDataManager?.tableViewObjects[indexPath.row])!
            cell.setUpCell(object as! PFObject)
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("connectCell", forIndexPath: indexPath) as! OWCConnectWalmartTableViewCell
            let object = ((self.parentViewController as! OWCConnectMainView).connectDataManager?.tableViewObjects[indexPath.row])!
            cell.setUpCellAsPerson(object as! PFUser)
            return cell
        }

    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (self.parentViewController as! OWCConnectMainView).connectSegmentedControl.selectedSegmentIndex == 0{
            
        }else{
           (self.parentViewController as! OWCConnectMainView).selectedIndex = indexPath
            (self.parentViewController as! OWCConnectMainView).performSegueWithIdentifier("showProfile", sender: nil)
        }

    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
