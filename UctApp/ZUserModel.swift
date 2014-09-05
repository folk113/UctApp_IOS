//
//  ZUserModel.swift
//  UctApp
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import Foundation

public class ZUserModel:NSObject
{
    var name:NSString?
    {
        get
        {
           return self.name
        }
        set
        {
           self.name = newValue
        }
    };
    var number:NSString?
    {
        get
        {
            return self.number
        }
        set
        {
            self.number = newValue
        }
    };

    override init()
    {
        super.init()
    }
    
    convenience init(name:NSString,number:NSString)
    {
        self.init()
        self.name = name
        self.number = number
    }
    
}