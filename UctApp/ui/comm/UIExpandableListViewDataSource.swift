//
//  UIExpandableListViewDataSource.swift
//  UctApp
//
//  Created by ptyt on 14-9-9.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

@objc protocol UIExpandableListViewDataSource :NSObjectProtocol{
    func getGroupCount(tableView: UITableView, _ section: Int)->Int
    func getSubGroupCount(expandedIndex:Int)->Int
    func getGroupCellView(tableView: UITableView, _ section:Int,_ groupRow:Int) -> UITableViewCell
    func getSubGroupCellView(tableView: UITableView, _ section:Int,_ groupRow:Int,_ subGroupRow:Int) -> UITableViewCell
    func onCellSelected(section:Int,_ groupRow:Int,_ subGroupRow:Int)
}
