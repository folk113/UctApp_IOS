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
    class func notifyBanner()
    {
            // 初始化本地通知对象
        var notification:UILocalNotification = UILocalNotification()
        
        // 设置通知的提醒时间
        var currentDate:NSDate   = NSDate.date()
        notification.timeZone =  NSTimeZone.defaultTimeZone()// 使用本地时区
        notification.fireDate = currentDate.dateByAddingTimeInterval(5.0)
        
        // 设置重复间隔
        notification.repeatInterval = NSCalendarUnit.CalendarUnitMinute
        // 设置提醒的文字内容
        notification.alertBody   = "Wake up, man"
        notification.alertAction = "起床了"
        
        // 通知提示音 使用默认的
        notification.soundName = UILocalNotificationDefaultSoundName;
        
        // 设置应用程序右上角的提醒个数
        notification.applicationIconBadgeNumber++;
        
        // 设定通知的userInfo，用来标识该通知
        var aUserInfo:NSMutableDictionary = NSMutableDictionary()
        aUserInfo["LocalNotificationID"] = "LocalNotificationID";
        notification.userInfo = aUserInfo;
    
        // 将通知添加到系统中
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    class func clearNotify(var notifcationId:String)
    {
        // 取消某个特定的本地通知
        for noti:UILocalNotification in UIApplication.sharedApplication().scheduledLocalNotifications as [UILocalNotification]
        {
//            noti.userInfo
            //            NSString *notiID = noti.userInfo[kLocalNotificationID];
//            NSString *receiveNotiID = notification.userInfo[kLocalNotificationID];
//            if ([notiID isEqualToString:receiveNotiID]) {
//                [[UIApplication sharedApplication] cancelLocalNotification:notification];
//                return;
        }
    }
    
    class func clearNotify(notification:UILocalNotification)
    {
        UIApplication.sharedApplication().cancelLocalNotification(notification)
    }
    
    class func clearAllNotify()
    {
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        UIApplication.sharedApplication().cancelAllLocalNotifications();
    }
    
}
