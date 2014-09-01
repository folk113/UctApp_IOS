//
//  FirstViewController.swift
//  UctApp
//
//  Created by ptyt on 14-8-28.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView:UITableView!
    let groupcell_identifier = "groupcell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.tableView.delegate = self
       self.tableView.dataSource = self
       var nib = UINib(nibName: "GroupCellViewController", bundle: nil);
       self.tableView.registerNib(nib, forCellReuseIdentifier: groupcell_identifier)
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    
 
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(groupcell_identifier) as UITableViewCell
      
        cell.backgroundColor = UIColor.blueColor()
        return cell;
    }
    
    
}

