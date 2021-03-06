//
//  AppDelegate.swift
//  UctApp
//
//  Created by ptyt on 14-8-28.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    var bgTask:UIBackgroundTaskIdentifier = 0
    
    var counter:Int = 0


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
//        StatusBarManager.notifyBanner()
//        StatusBarManager.clearAllNotify()
    
        NSLog("didFinishLaunching")
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
         NSLog("applicationWillResignActive")
    }
    
    func backgroundHandler()
    {
        NSLog("### -->backgroundinghandler");

        var app:UIApplication = UIApplication.sharedApplication()

        bgTask = app.beginBackgroundTaskWithExpirationHandler({

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                
                while (true)
                {
                    NSLog("counter:%d", self.counter++)
                    sleep(1)
                }
                
                });

        })

        app.endBackgroundTask(bgTask)
        bgTask = UIBackgroundTaskInvalid
    }
    
    func applicationDidEnterBackground(application: UIApplication!) {
        UIApplication.sharedApplication().setKeepAliveTimeout(600, handler:{ self.backgroundHandler }())
        NSLog("enter background")
        
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        NSLog("enter foreground")
        UIApplication.sharedApplication().clearKeepAliveTimeout()
        
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        NSLog("applicationDidBecomeActive")
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//        UIApplication.sharedApplication().cancelAllLocalNotifications()
         NSLog("applicationWillTerminate")
        
    }
    
    
    func application(application:UIApplication,didReceiveLocalNotification notification:UILocalNotification){
        NSLog("Application did receive local notifications")
        var alert:UIAlertView = UIAlertView(title: "Hello", message: "welcome", delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }

}

