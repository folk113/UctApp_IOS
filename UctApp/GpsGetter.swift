////
////  GpsGetter.swift
////  UctApp
////
////  Created by folk113 on 14/10/25.
////  Copyright (c) 2014年 ptyt. All rights reserved.
////
//
//import Foundation
//import CoreLocation
//
//var mLocationManager:CLLocationManager!;
//var mStatus:CLAuthorizationStatus!;
//
//class GpsGetter:CLLocationManagerDelegate
//{
//    func isGpsUsable()->Bool
//    {
//        
//        
//        mStatus = CLLocationManager.authorizationStatus();
//        if mStatus == CLAuthorizationStatus.Restricted ||
//            mStatus == CLAuthorizationStatus.Denied
//        {
//            return false;
//        }
//        
//        mLocationManager = CLLocationManager();
//        mLocationManager.delegate = self
//        mLocationManager.startUpdatingLocation()
//        
//        requestAuthor(true);
//        
//        if CLLocationManager.significantLocationChangeMonitoringAvailable()
//        {
//            
//        }
//        
//        
//        
//        return true;
//    }
//
//
//    func requestAuthor(isAlwaysRequest:Bool)
//    {
//        if mStatus == CLAuthorizationStatus.NotDetermined
//        {
//            if isAlwaysRequest
//            {
//                mLocationManager.requestAlwaysAuthorization();
//            }
//            else
//            {
//                mLocationManager.requestWhenInUseAuthorization();
//            }
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
//    {
//        
//    }
//    
//    /*
//    *  locationManager:didUpdateHeading:
//    *
//    *  Discussion:
//    *    Invoked when a new heading is available.
//    */
//    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!)
//    {
//        
//    }
//    
//    func isEqual(object: AnyObject?) -> Bool
//    {
//        
//    }
//    
//    
//    func `self`() -> GpsGetter!
//    {
//        return self
//    }
//    
//    func isProxy() -> Bool
//    {
//        return false
//    }
//    
//    func isKindOfClass(aClass: AnyClass) -> Bool
//    {
//        return true
//        
//    }
//    func isMemberOfClass(aClass: AnyClass) -> Bool
//    {
//        return true
//    }
//    func conformsToProtocol(aProtocol: Protocol) -> Bool
//    {
//        return true
//    }
//    
//    func respondsToSelector(aSelector: Selector) -> Bool
//    {
//        return true
//    }
//    
//}