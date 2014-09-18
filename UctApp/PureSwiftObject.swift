//
//  File.swift
//  UctApp
//  Created by ptyt on 14-9-18.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

import Foundation

// Note '@objc' prefix
@objc class PureSwiftObject {

    var obj:CustomObject;
    
    var name: String

    init(name: String) {
        self.name = name
        obj = CustomObject()
    }

    // Needed to add a class level initializer

    class func newInstanceNamed(name: String) -> PureSwiftObject {
        return PureSwiftObject(name: name)
    }

    // Just a method for demonstration
    func someMethod() {
        obj.someMethod()
        println("Some method ran in pure swift object")
    }
}
