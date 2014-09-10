//
//  GpsManager.swift
//  UctApp
//
//  Created by folk113 on 14-9-10.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import UIKit
import CoreLocation

class GpsManager: NSObject {
   
    class func isGpsOpen()->Bool
    {
       if CLLocationManager.locationServicesEnabled() &&
        CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized
       {
           NSLog("手机gps定位已经开启")
           return true
       }
       return false
    }
    
   
}
