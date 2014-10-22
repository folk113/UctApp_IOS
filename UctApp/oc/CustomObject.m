//
//  NSOperation_CustomObject.h
//  UctApp
//
//  Created by ptyt on 14-9-18.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

#import "CustomObject.h"
//#import "UctApp-PureSwiftObject.h"

@implementation CustomObject

//-(id)init
//{
//    PureSwiftObject * pureSwiftObject = [PureSwiftObject newInstanceNamed:@"Janet"];
//    NSLog(@"PureSwiftNamed: %@", pureSwiftObject.name);
//    [pureSwiftObject someMethod];
//}

- (void) someMethod {
    NSLog(@"SomeMethod Ran");
}

@end