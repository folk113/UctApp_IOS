//
//  ZGroupModel.swift
//  UctApp
//
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import Foundation


class ZGroupModel:NSObject
{
    var users:NSMutableArray = NSMutableArray()
    var name:NSString?
    {
        set{
            self.name = newValue
        }
        get{
           return self.name
        }
    }
    var number:NSString?
    {
        set{
            self.number = newValue
        }get{
            return self.number
        }
    }
    
    override init()
    {
        super.init()
    }
    
    convenience init(_ name:NSString!,_ number:NSString!)
    {
        self.init()
        self.name = name
        self.number = number
    }
    
    convenience init(_ name:NSString!,_ number:NSString!,_ users:NSArray)
    {
        self.init(name,number);
        
    }
    
    func addUser(user:ZUserModel!)
    {
        users.addObject(user)
    }   
    
    
}
