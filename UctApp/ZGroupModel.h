//
//  ZGroupModel.h
//  UctApp
//
//  Created by ptyt on 14-9-4.
//  Copyright (c) 2014年 ptyt. All rights reserved.
//

#ifndef __UctApp__ZGroupModel__
#define __UctApp__ZGroupModel__

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <list>
#include "ZUserModel.h"
using namespace std;

class ZGroupModel
{
public:
    ZGroupModel();
    ~ZGroupModel();
    ZGroupModel(string name,string number);
    void setName(string name);
    void setNumber(string number);
    string getName();
    string getNumber();
    void addUser(ZUserModel user);
    void clearUsers();
private:
    string name;
    string number;
    list<ZUserModel>* users;
    
};

#endif /* defined(__UctApp__ZGroupModel__) */
