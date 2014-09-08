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
    var selectedGroupIndex:Int = 0
    var isGroupExpanded:Bool = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var group1:ZGroupModel = ZGroupModel("组1",number: "10000");
        var users1:[ZUserModel] = [ZUserModel("用户1", number: "10001"),
                                  ZUserModel("用户2", number: "10002"),
                                  ZUserModel("用户3", number: "10003"),
                                  ZUserModel("用户4", number: "10004")]
        group1.addUsers(users1)
        data.addObject(group1)
        
        var group2:ZGroupModel = ZGroupModel("组2",number: "20000");
        var users2:[ZUserModel] = [ZUserModel("用户1", number: "20001"),
            ZUserModel("用户2", number: "20002"),
            ZUserModel("用户3", number: "20003"),
            ZUserModel("用户4", number: "20004")]
        group2.addUsers(users2)
        data.addObject(group2)
        
        var group3:ZGroupModel = ZGroupModel("组3",number: "30000");
        var users3:[ZUserModel] = [ZUserModel("用户1", number: "30001"),
            ZUserModel("用户2", number: "30002"),
            ZUserModel("用户3", number: "30003"),
            ZUserModel("用户4", number: "30004")]
        group3.addUsers(users3)
        data.addObject(group3)
        
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !isGroupExpanded
        {
            return data.count
        }
        else
        {
            var group:ZGroupModel = data.objectAtIndex(selectedGroupIndex) as ZGroupModel
            return data.count + group.users.count
        }
        
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:GroupCellView! = self.tableView!.dequeueReusableCellWithIdentifier(group_identifier) as GroupCellView
        
        if isGroupExpanded
        {
            var sgroup:ZGroupModel = data.objectAtIndex(selectedGroupIndex) as ZGroupModel
            var users:NSMutableArray = sgroup.users
            
            if indexPath.row <= selectedGroupIndex
            {//组显示
                var group:ZGroupModel = data.objectAtIndex(indexPath.row) as ZGroupModel
               
                cell.textLabel!.text = group.name
//                cell.detailTextLabel!.text = group.number
                cell.imageView!.image = UIImage(named: "first")
            }
            else if indexPath.row > selectedGroupIndex && indexPath.row <= selectedGroupIndex + users.count
            {//用户显示
                var user:ZUserModel = users.objectAtIndex(indexPath.row - selectedGroupIndex - 1) as ZUserModel
                cell.textLabel!.text = user.name
//                cell.detailTextLabel!.text = user.number
                cell.imageView!.image = UIImage(named: "second")
            }
            else
            {//组显示
                var group:ZGroupModel = data.objectAtIndex(indexPath.row - users.count) as ZGroupModel
                cell.textLabel!.text = group.name
                cell.imageView!.image = UIImage(named: "first")
//              cell.detailTextLabel!.text = user.number
            }

        }
        else
        {
            var group:ZGroupModel = data.objectAtIndex(indexPath.row) as ZGroupModel
            cell.textLabel!.text = group.name
            cell.imageView!.image = UIImage(named: "first")
//            cell.detailTextLabel!.text = group.number
        }
        
        return cell
    }
   
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        if isGroupExpanded
        {
//            var group:ZGroupModel = data.objectAtIndex(selectedGroupIndex) as ZGroupModel
//            var users:NSMutableArray = group.users
//            
//            if indexPath.row > selectedGroupIndex + 1 && indexPath.row < selectedGroupIndex + users.count
//            {
//                selectedGroupIndex = indexPath.row
//                return
//            }
        }
    
        
        if selectedGroupIndex != indexPath.row
        {
            selectedGroupIndex = indexPath.row
            isGroupExpanded = false
        }
        else if isGroupExpanded
        {
            deleteUser(tableView, indexPath)
            return
        }

        isGroupExpanded = true
        
        self.tableView.beginUpdates()
        
        var paths:[AnyObject] = [AnyObject]()
        
        var group:ZGroupModel = data.objectAtIndex(indexPath.row) as ZGroupModel
        var size:Int = group.users.count
        for i in 0...size-1
        {
            var indexP:NSIndexPath = NSIndexPath(forRow: indexPath.row+1+i, inSection: indexPath.section)
            paths.append(indexP)
        }
        
        self.tableView.insertRowsAtIndexPaths(paths, withRowAnimation:UITableViewRowAnimation.Top)
        self.tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!)
    {
       deleteUser(tableView, indexPath)
    }
    
    
    func deleteUser(tableView: UITableView!, _ indexPath: NSIndexPath!)
    {
        if selectedGroupIndex < 0 || isGroupExpanded == false
        {
            return
        }
        
        var sgroup:ZGroupModel = data.objectAtIndex(selectedGroupIndex) as ZGroupModel
        var users:NSMutableArray = sgroup.users
//        if indexPath.row > selectedGroupIndex + 1 && indexPath.row < selectedGroupIndex + users.count
//        {
//            selectedGroupIndex = indexPath.row
//            return
//        }
        
        isGroupExpanded = false
        
        self.tableView!.beginUpdates()
        
        var size = users.count
        
        var paths:[NSIndexPath] = [NSIndexPath]()
        for i in 0...size-1
        {
            var indexP:NSIndexPath = NSIndexPath(forRow: selectedGroupIndex+i+1, inSection: indexPath.section)
            paths.append(indexP)
        }
        
        self.tableView!.deleteRowsAtIndexPaths(paths, withRowAnimation:UITableViewRowAnimation.Bottom)
        
        self.tableView!.endUpdates()
    }

}
