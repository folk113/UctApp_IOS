//
//  GroupViewController.swift
//  UctApp
//
//  Created by folk113 on 14-8-31.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    
    let group_identifier = "group_cell"
    let user_identifier = "user_cell"
    var data:NSMutableArray = NSMutableArray()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib:UINib = UINib(nibName: "GroupCellView", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: group_identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
//        return gdata.count
        return numInsert
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        var cell:GroupCellView? = self.tableView!.dequeueReusableCellWithIdentifier(group_identifier) as? GroupCellView
        
        cell!.textLabel.text = "label_" + indexPath.row.description
        //gdata.objectAtIndex(indexPath.row) as NSString
        cell!.imageView.image = UIImage(named: "second")
        cell!.detailTextLabel!.text = "detail_" + indexPath.row.description
        return cell
    }
    
    let delayInSeconds = 0
    
    
    var numInsert:Int = 8;
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.tableView!.beginUpdates()

//        var sections: NSIndexSet! = NSIndexSet(indexesInRange: NSMakeRange(0,3))
//        numInsert+=3
//        self.tableView!.insertSections(sections, withRowAnimation: UITableViewRowAnimation.Top)
        
        var indexP:NSIndexPath = NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)
        
        var paths:[AnyObject]? = [indexP]
        
        self.tableView!.insertRowsAtIndexPaths(paths!, withRowAnimation:UITableViewRowAnimation.Top)
        numInsert += 1
        
        self.tableView!.endUpdates()
    }
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.tableView!.beginUpdates()
        
        
//        var indexP:NSIndexPath = NSIndexPath(forRow: indexPath.row-1, inSection: indexPath.section)
//       self.tableView!.deleteRowsAtIndexPaths(NSArray().arrayByAddingObject(indexP), withRowAnimation:UITableViewRowAnimation.Bottom)
//        
//        numInsert -= 1
        self.tableView!.endUpdates()
    }

}
