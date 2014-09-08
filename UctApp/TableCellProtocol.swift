//
//  TableCellProtocol.swift
//  UctApp
//
//  Created by folk113 on 14-9-8.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

@objc protocol GroupellProtocol:NSObjectProtocol{
    func onCellSelected(data:ZGroupModel,tableView:UITableView,indexPath: NSIndexPath, isExpanded:Bool)
    func onCellDeselected(tableView:UITableView,indexPath: NSIndexPath)
//    optional func onGroupExpanded(tableView:UITableView,indexPath: NSIndexPath)
//    optional func onGroupCollapse(tableView:UITableView,indexPath: NSIndexPath)
}
