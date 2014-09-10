//
//  StatusBarManager.swift
//  UctApp
//
//  Created by ptyt on 14-9-10.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

class StatusBarManager: NSObject {
   //http://blog.csdn.net/bihailantian1988/article/details/7383197
    func notifyBanner()
    {
        var notification:UILocalNotification = UILocalNotification()
        notification.
        notification.alertLaunchImage = "first"
        notification.regionTriggersOnce = false
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func clearNotify()
    {
        
    }
    
    func clearAllNotify()
    {
        var badgeCount:Int = UIApplication.sharedApplication().applicationIconBadgeNumber
        UIApplication.sharedApplication().cancelAllLocalNotifications();
    }
    
}
