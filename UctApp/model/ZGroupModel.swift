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
    var layer:Int = 0
    var childs:NSMutableArray = NSMutableArray()
    var name:NSString?
    var number:NSString?
    
    override init()
    {
        super.init()
    }
    
    convenience init(_ name:NSString!,number:NSString!)
    {
        self.init()
        self.name = name
        self.number = number
    }
    
    
    convenience init(_ name:NSString!,number:NSString!,users:[ZGroupModel])
    {
        self.init(name,number: number);
        addChilds(users)
    }
    
    func addUser(user:ZGroupModel!)
    {
        childs.addObject(user)
    }   
    
    func addChilds(users:[ZGroupModel])
    {
        self.childs.addObjectsFromArray(users);
    }
    func clearUser()
    {
        self.childs.removeAllObjects()
    }
    
}
