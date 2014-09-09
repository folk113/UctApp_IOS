//
//  UIExpandableListView.swift
//  UctApp
//
//  Created by ptyt on 14-9-9.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

class UIExpandableListView: UITableView,UITableViewDataSource,UITableViewDelegate {
    var isExpanded:Bool = false
    var expandedIndex:Int = 0
    var mDataSource:UIExpandableListViewDataSource!
    var subListCount:Int = 0
    
//    override init(frame: CGRect, style: UITableViewStyle)
//    {
//        super.init(frame: frame, style: style);
//        self.delegate = self
//        self.dataSource = self
//    }
//    
//    required init(coder: NSCoder)
//    {
//        super.init(coder: coder)
//    }

//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func initUi()
    {
//        NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:2];
//        [tableView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionBottom];
//        NSIndexPath *path=[NSIndexPath indexPathForItem:0 inSection:2];
//        [self tableView:tableView didSelectRowAtIndexPath:path];
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        if isExpanded
        {
            return mDataSource.getGroupCount(tableView, section) + subListCount
        }
        else
        {
            return mDataSource.getGroupCount(tableView, section)
        }
    }
   
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        if isExpanded
        {
            var sublistCount = mDataSource.getSubGroupCount(expandedIndex)
            if indexPath.row > expandedIndex && indexPath.row <= expandedIndex + sublistCount
            {
                return mDataSource.getSubGroupCellView(tableView, indexPath.section,expandedIndex,indexPath.row-expandedIndex-1)
            }
            else
            {
                return mDataSource.getGroupCellView(tableView, indexPath.section,expandedIndex)
            }
        }
        else
        {
            return mDataSource.getGroupCellView(tableView, indexPath.section,indexPath.row)
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        if !isExpanded
        {
            if expandedIndex == indexPath.row
            {
                var sublistCount = mDataSource.getSubGroupCount(expandedIndex)
                addRow(tableView,indexPath,sublistCount)
                return
            }
            else
            {
                expandedIndex = indexPath.row
                mDataSource.onCellSelected(indexPath.section, indexPath.row, -1)
            }
        }
        else
        {
            var sublistCount = mDataSource.getSubGroupCount(expandedIndex)
            if indexPath.row <= expandedIndex || indexPath.row > expandedIndex + sublistCount
            {
                deleteRow(tableView,indexPath,sublistCount)
                
                if indexPath.row > expandedIndex
                {
                    expandedIndex = indexPath.row - sublistCount
                }
                else
                {
                    expandedIndex = indexPath.row
                }
                mDataSource.onCellSelected(indexPath.section, expandedIndex, -1)
                return
            }
            else
            {
                var subGroupIndex:Int = indexPath.row - expandedIndex - 1
                mDataSource.onCellSelected(indexPath.section, expandedIndex, subGroupIndex)
            }
        }
        
    }
    
    @availability(iOS, introduced=3.0)
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!)
    {
//        if isExpanded
//        {
//            var sublistCount = mDataSource!.getSubGroupCount(expandedIndex)
//            if indexPath.row < expandedIndex || indexPath.row > expandedIndex + sublistCount
//            {
//                deleteRow(tableView,indexPath,sublistCount)
//            }
//        }
    }
    
    func deleteRow(tableView: UITableView!,_ indexPath: NSIndexPath!,_ sublistCount:Int)
    {
        isExpanded = false
        tableView.beginUpdates()
        var indexPaths = [NSIndexPath]()
        
        for i in 1...sublistCount
        {
            var path = NSIndexPath(forRow: expandedIndex+i, inSection: indexPath.section);
            indexPaths.append(path)
        }
        subListCount = 0
        
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        tableView.endUpdates()

    }
    
    func addRow(tableView: UITableView!,_ indexPath: NSIndexPath!,_ sublistCount:Int)
    {
        isExpanded = true
        expandedIndex = indexPath.row
        subListCount = sublistCount
        tableView.beginUpdates()
        var indexPaths = [NSIndexPath]()
        
        for i in 1...subListCount
        {
           var path = NSIndexPath(forRow: expandedIndex+i, inSection: indexPath.section);
           indexPaths.append(path)
        }
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        tableView.endUpdates()
    }
    
}
