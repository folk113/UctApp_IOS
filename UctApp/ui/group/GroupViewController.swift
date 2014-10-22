//
//  GroupViewController.swift
//  UctApp
//
//  Created by folk113 on 14-8-31.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController,UIExpandableListViewDataSource {
    
    @IBOutlet var tableView:UIExpandableListView!
    
    let group_identifier = "group_cell"
    let subgroup_identifier = "subgroup_cell"
    var data:NSMutableArray = NSMutableArray()
    var selectedGroupIndex:Int = 0
    var isGroupExpanded:Bool = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var group1:ZGroupModel = ZGroupModel("组1",number: "10000");
        var users1:[ZGroupModel] = [ZGroupModel("用户1", number: "10001"),
                                  ZGroupModel("用户2", number: "10002"),
                                  ZGroupModel("用户3", number: "10003"),
                                  ZGroupModel("用户4", number: "10004")]
        group1.addChilds(users1)
        data.addObject(group1)
        
        var group2:ZGroupModel = ZGroupModel("组2",number: "20000");
        var users2:[ZGroupModel] = [ZGroupModel("用户1", number: "20001"),
            ZGroupModel("用户2", number: "20002"),
            ZGroupModel("用户3", number: "20003"),
            ZGroupModel("用户4", number: "20004")]
        group2.addChilds(users2)
        data.addObject(group2)
        
        var group3:ZGroupModel = ZGroupModel("组3",number: "30000");
        var users3:[ZGroupModel] = [ZGroupModel("用户1", number: "30001"),
            ZGroupModel("用户2", number: "30002"),
            ZGroupModel("用户3", number: "30003"),
            ZGroupModel("用户4", number: "30004")]
        group3.addChilds(users3)
        data.addObject(group3)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib:UINib = UINib(nibName: "GroupCellView", bundle: nil)!
        self.tableView.registerNib(nib, forCellReuseIdentifier: group_identifier)
        
        nib = UINib(nibName: "SubGroupCellView", bundle: nil)!
        self.tableView.registerNib(nib, forCellReuseIdentifier: subgroup_identifier)
        
        self.tableView.mDataSource = self
        self.tableView.dataSource = self.tableView
        self.tableView.delegate = self.tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getGroupCount(tableView: UITableView, _ section: Int)->Int
    {
        return data.count
    }
    
    func getSubGroupCount(expandedIndex:Int)->Int
    {
        var group:ZGroupModel = data.objectAtIndex(expandedIndex) as ZGroupModel
        return group.childs.count
    }
    
    func getGroupCellView(tableView: UITableView, _ section:Int,_ groupRow:Int) -> UITableViewCell
    {
        var cell:GroupCellView! = self.tableView!.dequeueReusableCellWithIdentifier(group_identifier) as GroupCellView
        var group:ZGroupModel = data.objectAtIndex(groupRow) as ZGroupModel
        
        cell.imageView!.image = UIImage(named:"first")
        cell.textLabel!.text = group.name
        cell.detailTextLabel!.text =  group.number
        return cell
    }
    func getSubGroupCellView(tableView: UITableView, _ section:Int,_ groupRow:Int,_ subGroupRow:Int) -> UITableViewCell
    {
        var cell:SubGroupCellView! = self.tableView!.dequeueReusableCellWithIdentifier(subgroup_identifier) as SubGroupCellView
        var group:ZGroupModel = data.objectAtIndex(groupRow) as ZGroupModel
        var subGroup:ZGroupModel = group.childs.objectAtIndex(subGroupRow) as ZGroupModel
        
        cell.imageView!.image = UIImage(named:"second")
        cell.textLabel!.text = subGroup.name
        cell.detailTextLabel!.text =  subGroup.number
        return cell
    }

    func onCellSelected(section:Int,_ groupRow:Int,_ subGroupRow:Int)
    {
        NSLog("section:%d\ngroup:%d\nsubgroup:%d",section, groupRow, subGroupRow);
    }

}
