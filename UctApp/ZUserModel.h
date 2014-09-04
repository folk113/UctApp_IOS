//
//  ZUserModel.h
//  UctApp
//
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

#ifndef __UctApp__ZUserModel__
#define __UctApp__ZUserModel__

#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

class ZUserModel
{
public:
    ZUserModel();
    ~ZUserModel();
    ZUserModel(string name,string number);
    void setName(string name);
    void setNumber(string number);
    string getName();
    string getNumber();
private:
    string name;
    string number;
    
};

#endif /* defined(__UctApp__ZUserModel__) */
